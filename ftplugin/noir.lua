-- local constants = require("noir.constants")
local constants = {
	noir_ctags_group = vim.api.nvim_create_augroup("noir-ctags", {}),
	noir_patterns = {".noir",".nr"},
	ctags_cmd={ "ctags", "--langmap=Rust:+(*.noir)", "--langmap=Rust:+(*.nr)" }
}

vim.lsp.config["aztec_nargo"] = {
	cmd = { "aztec-nargo", "lsp" },
	root_markers = { ".git", "Nargo.toml" },
	filetypes = { "noir" },
}
vim.lsp.enable("aztec_nargo")
vim.treesitter.language.register("rust", { "noir" })

vim.api.nvim_create_autocmd({ "bufwritepost" }, {
	group = constants.noir_ctags_group,
	pattern = constants.noir_patterns,
	callback = function()
		-- don't mutate the config variable!
		vim.system(vim.list_extend(vim.list_extend({}, constants.ctags_cmd ), { "-a", vim.fn.expand("%") }) )
	end,
	desc = "rewrite tags for current file after editing it",
})
