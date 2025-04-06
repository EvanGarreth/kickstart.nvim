return {
  'zbirenbaum/copilot.lua',
  -- only really use this at work
  cond = false,
  cmd = 'Copilot',
  build = ':Copilot auth',
  event = 'BufReadPost',
  opts = {
    -- suggestion = {
    --   enabled = not vim.g.ai_cmp,
    --   auto_trigger = true,
    --   hide_during_completion = vim.g.ai_cmp,
    --   keymap = {
    --     accept = false,
    --     next = '<M-]>',
    --     prev = '<M-[>',
    --   },
    -- },
    panel = { enabled = false },
    suggestion = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
