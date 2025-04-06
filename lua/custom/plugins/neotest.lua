return {
  -- Framework for unit testing
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'Issafalcon/neotest-dotnet',
    'rouge8/neotest-rust',
    'nvim-neotest/nvim-nio',
  },
  opts = {
    output = { open_on_run = true },
    adapters = {
      'neotest-dotnet',
      'neotest-rust',
    },
  },
  keys = {
    { '<leader>t', '', desc = '+test' },
    {
      '<leader>tf',
      function()
        require('neotest').run.run(vim.fn.expand '%')
      end,
      desc = '[t]est [f]ile',
    },
    {
      '<leader>tF',
      function()
        require('neotest').run.run(vim.uv.cwd())
      end,
      desc = '[t]est all Test [F]iles',
    },
    {
      '<leader>tt',
      function()
        require('neotest').run.run()
      end,
      desc = '[t]est [t]his',
    },
    {
      '<leader>tl',
      function()
        require('neotest').run.run_last()
      end,
      desc = '[t]est [l]ast',
    },
    {
      '<leader>ts',
      function()
        require('neotest').summary.toggle()
      end,
      desc = '[t]ggle [s]ummary',
    },
    {
      '<leader>to',
      function()
        require('neotest').output.open { enter = true, auto_close = true }
      end,
      desc = '[t]est [o]utput',
    },
    {
      '<leader>tO',
      function()
        require('neotest').output_panel.toggle()
      end,
      desc = '[t]oggle [o]utput',
    },
    {
      '<leader>tS',
      function()
        require('neotest').run.stop()
      end,
      desc = '[t]est [s]top',
    },
    {
      '<leader>tw',
      function()
        require('neotest').watch.toggle(vim.fn.expand '%')
      end,
      desc = '[t]oggle [w]atch',
    },
  },
}
