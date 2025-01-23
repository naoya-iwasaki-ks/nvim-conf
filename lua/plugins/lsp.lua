return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim"
    },
    config = function()
      require('config.lsp')
    end,
  },
  {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      require('config.guard')
    end,
  }
}
