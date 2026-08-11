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
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        suppress_on_insert = true,
        ignore_done_already = true,
        ignore_empty_message = true,
      }
    },
  },
  {
    "stevearc/conform.nvim",
    dependencies = {},
    config = function()
      require('config.conform')
    end,
  },
}
