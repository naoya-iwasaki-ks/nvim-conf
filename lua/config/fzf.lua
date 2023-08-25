require("fzf-lua").setup {}

vim.api.nvim_create_user_command('Rg', 'FzfLua grep_project', {})

vim.keymap.set('n', 'g*', '<cmd>FzfLua grep_cWORD<CR>')

vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>')
vim.keymap.set('n', '<leader><C-r>', '<cmd>FzfLua oldfiles<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>FzfLua lsp_workspace_diagnostics<CR>')

