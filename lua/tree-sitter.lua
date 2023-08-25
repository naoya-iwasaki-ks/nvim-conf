require('nvim-treesitter.configs').setup {
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

  indent = {
    enable = true,
  }
}
