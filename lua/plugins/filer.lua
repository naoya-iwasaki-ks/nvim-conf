return {
  "stevearc/oil.nvim",
  config = function()
    require('config.oil')
  end,
  dependencies = {
    {
      "echasnovski/mini.icons",
      opts = {}
    }
  },
}
