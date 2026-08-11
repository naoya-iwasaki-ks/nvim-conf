return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = {
    "markdown",
    "codecompanion",
  },
  opts = {
    render_modes = true
  },
  config = function()
    require('config.markdown')
  end,
}
