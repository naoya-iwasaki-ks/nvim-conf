return {
  { "junegunn/fzf" },
  {
    "ibhagwan/fzf-lua",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('config.fzf')
    end,
  }
}
