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
    status = { virtual_text = true },
    output = { open_on_run = true },
    adapters = {
      'neotest-dotnet',
      'neotest-rust',
    },
  },
  config = function()
    if opts.adapters then
      local adapters = {}
      for name, config in pairs(opts.adapters or {}) do
        if type(name) == 'number' then
          if type(config) == 'string' then
            config = require(config)
          end
          adapters[#adapters + 1] = config
        elseif config ~= false then
          local adapter = require(name)
          if type(config) == 'table' and not vim.tbl_isempty(config) then
            local meta = getmetatable(adapter)
            if adapter.setup then
              adapter.setup(config)
            elseif adapter.adapter then
              adapter.adapter(config)
              adapter = adapter.adapter
            elseif meta and meta.__call then
              adapter = adapter(config)
            else
              error('Adapter ' .. name .. ' does not support setup')
            end
          end
          adapters[#adapters + 1] = adapter
        end
      end
      opts.adapters = adapters
    end

    require('neotest').setup(opts)
  end,
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
