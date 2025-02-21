return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      hidden = true,
      ignored = true,
      layout = 'vertical',
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
  },
  keys = {
    {
      '<leader><space>',
      function()
        Snacks.picker.buffers()
      end,
      desc = 'search buffers',
    },
    {
      '<leader>sf',
      function()
        Snacks.picker.smart { filter = { cwd = true } }
      end,
      desc = '[s]earch [f]iles',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = '[s]earch [g]rep',
    },
    {
      '\\',
      function()
        Snacks.explorer()
      end,
      desc = 'file explorer',
    },
    {
      '<leader>?',
      function()
        Snacks.picker.recent()
      end,
      desc = '[?] search recent',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = '[s]earch [d]iagnostics',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = '[s]earch [h]elp',
    },
    {
      '<leader>sr',
      function()
        Snacks.picker.resume()
      end,
      desc = '[s]earch [r]esume',
    },
    --- lsp
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gi',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gy',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto T[y]pe Definition',
    },
  },
}
