return {
  "jiaoshijie/undotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('config.undotree')
  end,
}
