-- Enables the experimental lua module loader to improve startup time
if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require('util.debug').dump(...)
end
vim.print = _G.dd

require('config')
