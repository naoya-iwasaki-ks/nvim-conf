require("fzf-lua").setup {
  lsp = {
    -- make lsp requests synchronous so they work with null-ls
    async_or_timeout = 3000,
  },
}

vim.api.nvim_create_user_command('Rg', 'FzfLua grep_project', {})

vim.keymap.set('n', 'g*', '<cmd>FzfLua grep_cWORD<CR>')

vim.keymap.set('n', '<leader>c', '<cmd>FzfLua command_history<CR>')
vim.keymap.set('n', '<leader>f', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>gc', '<cmd>FzfLua git_commits<CR>')
vim.keymap.set('n', '<leader>gb', '<cmd>FzfLua git_branches<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>FzfLua buffers<CR>')
vim.keymap.set('n', '<leader><C-r>', '<cmd>FzfLua oldfiles<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>FzfLua lsp_workspace_diagnostics<CR>')

