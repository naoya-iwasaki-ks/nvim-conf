return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'zbirenbaum/copilot-cmp' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
    },
    config = function()
      require('config.snippets')
      require('config.cmp')
    end,
  }
}
