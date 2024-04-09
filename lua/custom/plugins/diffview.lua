return {
  'sindrets/diffview.nvim',
  lazy = false,
  opts = {
    keymaps = {
      view = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      diff1 = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      diff2 = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      diff3 = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      diff4 = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      file_panel = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
      file_history_panel = {
        { 'n', '<leader>q', '<Cmd>DiffviewClose<CR>', { desc = 'Close Diffview' } },
      },
    },
  },
}
