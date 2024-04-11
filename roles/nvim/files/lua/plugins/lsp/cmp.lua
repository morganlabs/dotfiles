return {
  "hrsh7th/nvim-cmp",
  "zbirenbaum/copilot-cmp",
  event = "InsertEnter",
  config = function()
    local lsp_zero = require("lsp-zero")
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_copilot = require("copilot_cmp")

    lsp_zero.extend_cmp()
    cmp_copilot.setup()

    cmp.setup({
      formatting = lsp_zero.cmp_format(),
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<S-Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
    })
  end,
}
