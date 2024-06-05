return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "williamboman/mason-lspconfig.nvim"
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
