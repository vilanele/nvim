
require'lspconfig'.cssmodules_ls.setup {
    on_attach = function (client)
        -- avoid accepting `definitionProvider` responses from this LSP
        client.server_capabilities.definitionProvider = false
    end,
}
