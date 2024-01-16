return {
	'akinsho/flutter-tools.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/dressing.nvim', -- optional for vim.ui.select
		'nvim-telescope/telescope.nvim'
	},
	-- may not be necessary
	ft = 'dart',
	config = function()
		require("flutter-tools").setup {
			lsp = {
				on_attach = function(client, bufnr)
					-- TODO make this a utility method
					
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

					nmap('<leader>ca', require("actions-preview").code_actions, '[C]ode [A]ction')
					nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					nmap('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
					nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
					nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
						'[W]orkspace [S]ymbols')

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
			}
		}
	end,
}
