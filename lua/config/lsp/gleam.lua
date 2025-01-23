-- gleam settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = require("mason-lspconfig").on_attach

local on_attach = function(client)
  if client.name == "gleam" then
    client.server_capabilities.documentFormattingProvider = true
  end
  -- lsp_keymaps() loads my lsp handler keymaps, not gleam specific and you should
  -- have this handled somehow if other lsp work for you
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

-- gotta have lspconfig imported with you pmanager, I reckon
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

lspconfig.gleam.setup({
  cmd = { "gleam", "lsp" },
  filetypes = { "gleam" },
  root_dir = lspconfig.util.root_pattern("gleam.toml", ".git"),
  on_attach = on_attach,
  capabilities = require("mason-lspconfig").capabilities,
})
