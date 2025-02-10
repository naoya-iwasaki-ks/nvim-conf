return {
  -- {
  --   "styled-components/vim-styled-components",
  --   branch = "main"
  -- },
  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
    config = function()
      require('config.swagger')
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "mattn/emmet-vim",
    config = function()
      vim.api.nvim_set_keymap('i', '<C-e>', "<Plug>(emmet-expand-abbr)", { noremap = true, silent = true })
    end
  }
}
