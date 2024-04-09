return {
  'nvchad/nvim-colorizer.lua',
  lazy = false,
  opts = {
    user_default_options = {
      sass = { enable = false, parsers = { 'css' } }, -- Enable sass colors
      mode = 'virtualtext',
      virtualtext = '■',
    },
    filetypes = {
      '*',
      '!toggleterm',
      '!mason',
    },
    buftypes = {
      '*',
      -- exclude prompt and popup buftypes from highlight
      '!prompt',
      '!popup',
      '!terminal',
    },
  },
}
