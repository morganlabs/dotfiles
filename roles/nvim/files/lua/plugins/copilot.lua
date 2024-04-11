return {
  "zbirenbaum/copilot.lua",
  config = function()
    local copilot = require("copilot")

    copilot.setup({
      filetypes = {
        javascript = true,
        typescript = true,
        lua = true,
        rust = true,
        python = true,
        astro = true,
        svelte = true,
        ["*"] = false,
      },
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end,
}
