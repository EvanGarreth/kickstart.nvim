vim.cmd [[highlight IndentHighlight1 guifg=#E9EDF4 guibg=#E9EDF4 gui=nocombine]]
vim.cmd [[highlight IndentHighlight2 guifg=#E5F2F0 guibg=#E5F2F0 gui=nocombine]]
vim.cmd [[highlight IndentHighlight3 guifg=#E3EFEE guibg=#E3EFEE gui=nocombine]]
vim.cmd [[highlight IndentHighlight4 guifg=#F4EEED guibg=#F4EEED gui=nocombine]]
vim.cmd [[highlight IndentHighlight5 guifg=#F5E8EA guibg=#F5E8EA gui=nocombine]]
vim.cmd [[highlight IndentHighlight6 guifg=#F1ECEA guibg=#F1ECEA gui=nocombine]]

return {
  'folke/snacks.nvim',
  opts = {
    indent = {
      indent = {
        priority = 1,
        enabled = true,
        only_scope = true,
        only_current = true,
        hl = {
          'IndentHighlight1',
          'IndentHighlight2',
          'IndentHighlight3',
          'IndentHighlight4',
          'IndentHighlight5',
          'IndentHighlight6',
        },
      },
      scope = {
        enabled = true,
        char = '│',
        hl = {
          'IndentHighlight1',
          'IndentHighlight2',
          'IndentHighlight3',
          'IndentHighlight4',
          'IndentHighlight5',
          'IndentHighlight6',
        },
      },
      -- chunk = {
      --   enabled = true,
      -- },
    },
  },
}
