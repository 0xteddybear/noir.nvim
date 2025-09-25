-- local constants = require("noir.constants")
local constants = {
	noir_ctags_group = vim.api.nvim_create_augroup("noir-ctags", {}),
	noir_patterns = {".noir",".nr"},
	ctags_cmd={ "ctags", "--langmap=Rust:+(*.noir)", "--langmap=Rust:+(*.nr)" }
}

vim.api.nvim_create_autocmd({ "vimenter" }, {
	group = constants.noir_ctags_group,
	callback = function()
		vim.system(vim.list_extend(vim.list_extend({}, constants.ctags_cmd ), { "-a", "." }) )
	end,
	desc = "index the whole codebase on startup",
})
