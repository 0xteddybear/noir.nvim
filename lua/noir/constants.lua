local noir_filetypes = { "nr", "noir" }
local noir_patterns = {}
for _, val in ipairs(noir_filetypes) do
	vim.list_extend(noir_patterns, { "*." .. val })
end
return {
	noir_ctags_group = vim.api.nvim_create_augroup("noir-ctags", {}),
	noir_filetypes = noir_filetypes,
	noir_patterns = noir_patterns,
	ctags_cmd={ "ctags", "--langmap=Rust:+(*.noir)", "--langmap=Rust:+(*.nr)" }
}
