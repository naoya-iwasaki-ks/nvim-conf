vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
  use {
    'wbthomason/packer.nvim',
    opt = true
  }

  use {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd [[
        if has('termguicolors')
          set termguicolors
        endif

        set background=dark

        let g:gruvbox_material_background = 'soft'
        let g:gruvbox_material_foreground = 'material'
        let g:gruvbox_material_better_performance=1

        colorscheme gruvbox-material
      ]]
    end
  }

  use "kyazdani42/nvim-web-devicons"

  use {
    "nvim-lualine/lualine.nvim",
    options = { theme = 'gruvbox-material' }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
  }

  use {
    "stevearc/oil.nvim",
    config = function()
      require('config.oil')
    end,
  }

  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use {
    "nvimdev/guard.nvim",
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      require('config.guard')
    end,
  }

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require('config.copilot')
    end,
  }

  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
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

  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
  }

  use {
    "styled-components/vim-styled-components",
    branch = "main"
  }

  use "airblade/vim-gitgutter"
  use "tpope/vim-rhubarb"
  use "tpope/vim-fugitive"
  use "junegunn/fzf"
  use {
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('config.fzf')
    end,
  }

  use "b0o/schemastore.nvim"

  use {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
    config = function()
      require('config.swagger')
    end,
  }

  use {
    "jiaoshijie/undotree",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require('config.undotree')
    end,
  }

  use {
    "mattn/emmet-vim",
    config = vim.cmd([[
      imap <C-e> <Plug>(emmet-expand-abbr)
    ]]),
  }
end)
