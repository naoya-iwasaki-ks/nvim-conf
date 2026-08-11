local markdown = require("render-markdown")

markdown.setup({
  file_types = {
    "markdown",
    "codecompanion",
  },
  render_modes = true,
  heading = {
    enabled = false,
  },
  bullet = {
    enabled = false,
  },
  code = {
    enabled = false,
  },
})
