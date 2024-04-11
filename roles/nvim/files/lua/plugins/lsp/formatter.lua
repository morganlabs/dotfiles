return {
  "stevearc/conform.nvim",
  dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local mti = require("mason-tool-installer")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        astro = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },

        python = { "isort", "black" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    mti.setup({
      ensure_installed = {
        "prettier",
        "isort",
        "black",
        "eslint_d",
        "pylint",
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end)
  end,
}
