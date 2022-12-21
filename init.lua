require "base"
require "plugins"

require "lua-line"
require "lsp"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "plugins.lua" },
  command = "PackerCompile",
})
