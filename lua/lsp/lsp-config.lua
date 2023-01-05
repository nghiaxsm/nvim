local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local root_dir = function()
    return vim.fn.getcwd()
end

-- Show line diagnostics automatically in hover window
--vim.cmd([[
--  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
--]])

local servers = {'bashls', 'pyright', 'clangd', 'sumneko_lua', 'rust_analyzer',}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        root_dir = root_dir,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

