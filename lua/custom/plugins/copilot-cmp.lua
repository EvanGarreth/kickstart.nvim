return {
  'zbirenbaum/copilot-cmp',
  config = function()
    require('copilot_cmp').setup()
  end,
  lazy = false,
  -- only really use this at work
  cond = false,
}
