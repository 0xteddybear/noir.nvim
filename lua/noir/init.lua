-- local constants = require("noir.constants")
local constants = {
	noir_ctags_group = vim.api.nvim_create_augroup("noir-ctags", {}),
	noir_extensions = { "noir", "nr" },
	filetype = "noir",
	noir_patterns = { "*.noir", "*.nr" },
	ctags_cmd = {
		"ctags",
		"--langmap=Rust:+(*.noir)",
		"--langmap=Rust:+(*.nr)",
		"--exclude=*.md",
		"--exclude=*.ts",
		"--exclude=*.json",
		"--exclude=*.toml",
		"--append",
	},
}

return {
	setup = function(opts)
		constants = vim.tbl_deep_extend("force", constants, opts or {})
		local extensions = {}
		for _, val in ipairs(constants.noir_extensions) do
			extensions[val] = constants.filetype
		end
		vim.filetype.add({
			extension = extensions,
		})
		vim.lsp.config["aztec_nargo"] = {
			cmd = { "aztec-nargo", "lsp" },
			root_markers = { ".git", "Nargo.toml" },
			filetypes = { constants.filetype },
		}
		vim.lsp.enable("aztec_nargo")
		vim.treesitter.language.register("rust", { constants.filetype })

		vim.api.nvim_create_autocmd({ "bufwritepost", "bufreadpost" }, {
			group = constants.noir_ctags_group,
			pattern = constants.noir_patterns,
			callback = function()
				-- don't mutate the config variable!
				vim.system(vim.list_extend(vim.list_extend({}, constants.ctags_cmd), { vim.fn.expand("%") }))
			end,
			desc = "rewrite tags for current file after editing it",
		})
		vim.api.nvim_create_autocmd({ "vimenter" }, {
			group = constants.noir_ctags_group,
			callback = function()
				-- don't mutate the config variable!
				vim.system(vim.list_extend(vim.list_extend({}, constants.ctags_cmd), { "--recurse", "." }))
			end,
			desc = "index the whole codebase on startup",
		})
	end,
}
