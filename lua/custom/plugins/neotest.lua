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
  config = function()
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'neotest-dotnet',
        require 'neotest-rust',
      },
    }
  end,
}
