-- local constants = require("noir.constants")
local extensions = {}
for _, val in ipairs({"nr","noir"}) do
	extensions[val] = "noir"
end

vim.filetype.add({
	extension = extensions,
})
