vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
  use {
    "morhetz/gruvbox",
    config = function()
      vim.cmd([[
        colorscheme gruvbox
        set t_Co=256
        let &t_AB="\e[48;5;%dm"
        let &t_AF="\e[38;5;%dm"
        set background=dark
      ]])
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    },
    options = { theme = 'gruvbox' }
  }

  use {
    "scrooloose/nerdtree",
    opt = true,
    cmd = "NERDTreeToggle",
    config = vim.cmd([[
      noremap <C-n> :NERDTreeToggle<CR>
    ]])
  }

  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  use {
    "L3MON4D3/LuaSnip",
    tag = "v<CurrentMajor>.*"
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require('config.cmp')
    end,
  }
  use "saadparwaiz1/cmp_luasnip"
  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = function() require('config.snippets') end,
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/vim-vsnip"

  use {
    "sheerun/vim-polyglot",
    config = function()
      vim.g.csv_no_conceal = 1
    end
  }

  use "airblade/vim-gitgutter"
  use "tpope/vim-rhubarb"
  use "tpope/vim-fugitive"
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  use {
    "mattn/emmet-vim",
    opt = true,
    ft = {"vue", "javascriptreact", "html", "sass", "scss", "css"}
  }

  use {
    "udalov/kotlin-vim",
    opt = true,
    ft = {"kotlin"}
  }
end)
