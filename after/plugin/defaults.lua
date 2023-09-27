-- colorscheme
vim.cmd [[colorscheme catppuccin-latte]]

-- Tabs
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.shiftwidth = 0

vim.o.completeopt = 'noinsert,menuone,noselect'

-- Split
vim.o.splitbelow = true
vim.o.splitright = true

-- Hybrid line numbers
vim.o.relativenumber = true
vim.o.number = true

-- buffers 
vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'close buffer' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'move to left buffer'})
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'move to lower buffer'})
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'move to upper buffer'})
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'move to right buffer'})

-- resize
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { desc = 'move to left buffer'})
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { desc = 'move to lower buffer'})
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'move to upper buffer'})
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'move to right buffer'})

-- move lines
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- quit all 
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- file browser
pcall(require('telescope').load_extension, 'file_browser')
vim.keymap.set('n', '<leader>e', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'open [e]xplorer', noremap = true })

-- Toggleterm
require('toggleterm').setup {
    direction = 'float'
}

vim.keymap.set('n', '<C-t>', ':ToggleTerm<CR>', { desc = '[t]erminal' })
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><C-w>l', { desc = 'close [t]erminal' })

-- LazyGit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

local function _lazygit_toggle()
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>g', _lazygit_toggle, { noremap = true, silent = true, desc = 'lazy [g]it' })

-- flutter-tools
-- TODO : this is identical to the one in the init.lua; move it to another file & export?
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  nmap('<leader>rf', ':Format<CR>', '[R]e[f]ormat code')
end

require('flutter-tools').setup {
    lsp = {
        on_attach = on_attach
    },
    dev_log = {
        open_cmd = '30new'
    }
}

-- Common kill function for bdelete and bwipeout.
-- credits: based on bbye, nvim-bufdel and LunarVim.
---@param force? boolean defaults to false.
---@param ignore_list? table of buffer types to ignore.
local function close_current_buffer_LV(force, ignore_list)

    -- Command used to kill the buffer.
    local kill_command = "bd"

    -- Default list of items to ignore.
    if not ignore_list then
        ignore_list = {
           'nvimtree',
           'nofile',
           'startify',
           'terminal'
        }
    end

    -- Required data.
    local bo = vim.bo
    local api = vim.api
    local fmt = string.format
    local fnamemodify = vim.fn.fnamemodify
    local bufnr = api.nvim_get_current_buf()
    local bufname = api.nvim_buf_get_name(bufnr)
    local buf_type = api.nvim_buf_get_option(0, 'buftype')

    -- Check if the current buffer should be ignored.
    for _, type in ipairs(ignore_list) do
        if type == buf_type then
            -- Do not delete.
            return
        end
    end

    -- Warn user if a modified buffer is about to be deleted.
    if not force then
        local warning
        if bo[bufnr].modified then
            warning = fmt([[(%s) has unsaved changes.]], fnamemodify(bufname, ":t"))
        elseif buf_type == "terminal" then
            warning = fmt([[Terminal %s will be killed.]], bufname)
        end
        if warning then
            vim.ui.input({
            prompt = string.format([[%s. Close it anyway? [y]es or [n]o (default: no): ]], warning),
            }, function(choice)
                if choice:match "ye?s?" then force = true end
            end)
            if not force then return end
        end
    end

    -- Get list of windows IDs with the buffer to close.
    local windows = vim.tbl_filter(function(win)
        return api.nvim_win_get_buf(win) == bufnr
    end, api.nvim_list_wins())

    -- No windows to close.
    if #windows == 0 then return end

    -- Create force command.
    if force then
        kill_command = kill_command .. "!"
    end

    -- Get list of active buffers
    local buffers = vim.tbl_filter(function(buf)
        return api.nvim_buf_is_valid(buf) and bo[buf].buflisted
    end, api.nvim_list_bufs())

    -- For more than one buffer, pick the previous buffer (wrapping around if necessary)
    if #buffers > 1 then
        for i, v in ipairs(buffers) do
            if v == bufnr then
                local prev_buf_idx = i == 1 and (#buffers - 1) or (i - 1)
                local prev_buffer = buffers[prev_buf_idx]
                for _, win in ipairs(windows) do
                    api.nvim_win_set_buf(win, prev_buffer)
                end
            end
        end
    end

    -- Check if buffer still exists, to ensure the target buffer wasn't killed
    -- due to options like bufhidden=wipe.
    if api.nvim_buf_is_valid(bufnr) and bo[bufnr].buflisted then
        vim.cmd(fmt("%s %d", kill_command, bufnr))
    end

    -- If there was only one buffer (which had to be the current one), vim will
    -- create a new buffer (and keep a window open) on :bd.

end
