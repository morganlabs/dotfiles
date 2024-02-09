return {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        local masonlspc = require("mason-lspconfig")
        local lspc = require("lspconfig")
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }
            local set = vim.keymap.set
            local lspbuf = vim.lsp.buf
            local diagnostic = vim.diagnostic

            lsp_zero.buffer_autoformat()

            set("n", "gd", function() lspbuf.definition() end, opts)
            set("n", "K", function() lspbuf.hover() end, opts)
            set("n", "<leader>vd", function() diagnostic.open_float() end, opts)                              -- Diagnostics
            set("n", "<leader>ca", function() lspbuf.code_action() end, opts)                                 -- Code Actions
            set("n", "<leader>rn", function() lspbuf.rename() end, opts)                                      -- Rename
            set("n", "<leader>re", function() lspbuf.references() end, opts)                                  -- References
            set("n", "<leader>fmt", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end) -- Format
        end)

        -- LSPs
        masonlspc.setup({
            automatic_installation = true,
            ensure_installed = {
                "tsserver", "svelte", "rust_analyzer", "html",
                "emmet_ls", "cssls", "bashls", "lua_ls"
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lspc.lua_ls.setup(lua_opts)
                end,
                emmet_ls = function()
                    local capabilities = vim.lsp.protocol.make_client_capabilities()
                    capabilities.textDocument.completion.completionItem.snippetSupport = true

                    lspc.emmet_ls.setup({
                        capabilities = capabilities,
                        filetypes = { "astro", "eruby", "html", "htmldjango", "javascriptreact", "pug", "svelte", "typescriptreact", "vue" }
                    })
                end,
            }
        })
    end
}
