local ft = require('guard.filetype')

ft('typescript,javascript,typescriptreact'):fmt({
  cmd = 'prettierd',
  args = { '--stdin-filepath' },
  fname = true,
  stdin = true
})

ft('jsonc'):fmt({
  cmd = 'prettierd',
  args = { '--stdin-filepath' },
  fname = true,
  stdin = true
})

require("guard").setup({
  fmt_on_save = true,
  lsp_as_default_formatter = true,
})
