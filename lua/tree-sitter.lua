require('nvim-treesitter.install').prefer_git = true

require('nvim-treesitter').setup {
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gii',
      node_incremental = 'gin',
      scope_incremental = 'gis',
      node_decremental = 'giN',
    },
  },

  ensure_installed = { "diff" },

  indent = {
    enable = true,
  }
}
