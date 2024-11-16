vim.cmd [[highlight IndentBlanklineIndent1 guibg=#E9EDF4 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#E5F2F0 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guibg=#E3EFEE gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guibg=#F4EEED gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guibg=#F5E8EA gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guibg=#F1ECEA gui=nocombine]]
return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '',
        highlight = {
          'IndentBlanklineIndent1',
          'IndentBlanklineIndent2',
          'IndentBlanklineIndent3',
          'IndentBlanklineIndent4',
          'IndentBlanklineIndent5',
          'IndentBlanklineIndent6',
        },
      },
      whitespace = {
        remove_blankline_trail = true,
        highlight = {
          'IndentBlanklineIndent1',
          'IndentBlanklineIndent2',
          'IndentBlanklineIndent3',
          'IndentBlanklineIndent4',
          'IndentBlanklineIndent5',
          'IndentBlanklineIndent6',
        },
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    },
  },
}
