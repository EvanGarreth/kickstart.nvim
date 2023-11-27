return {
	'nvchad/nvim-colorizer.lua',
	lazy = false,
	opts = {
		user_default_options = {
			sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
			mode = "virtualtext",
			virtualtext = "■",
		}
	}
	-- config = function()
	-- 	require("colorizer").setup()
	-- end
}
