local ft = require('guard.filetype')

local function prettierd_fmt(buf, range, acc)
  local co = assert(coroutine.running())

  local handle = vim.system({ "prettierd", vim.api.nvim_buf_get_name(buf) }, {
    stdin = true,
  }, function(result)
    if result.code ~= 0 then
      -- "returns" the error
      coroutine.resume(co, result)
    else
      -- "returns" the result
      coroutine.resume(co, result.stdout)
    end
  end)

  handle:write(acc)
  handle:write(nil)        -- closes stdin
  return coroutine.yield() -- this returns either the error or the formatted code we returned earlier
end

ft('typescript,javascript,typescriptreact'):fmt({
  cmd = 'prettierd',
  args = { '--stdin-filepath' },
  fn = prettierd_fmt,
  fname = true,
  stdin = true
})

ft('jsonc'):fmt({
  cmd = 'prettierd',
  args = { '--stdin-filepath' },
  fn = prettierd_fmt,
  fname = true,
  stdin = true
})

vim.g.guard_config = {
  fmt_on_save = true,
  lsp_as_default_formatter = true,
}
