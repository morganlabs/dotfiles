return {
    "zbirenbaum/copilot.lua",
    dependencies = { "zbirenbaum/copilot-cmp" },
    event = "InsertEnter",
    config = function()
        require('copilot').setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
        require('copilot_cmp').setup()
    end
}
