return {
    "mbbill/undotree",
    lazy = true,
    keys = {
        { "<leader>u", vim.cmd.UndotreeToggle }
    },
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_SplitWidth = 48
        vim.g.undotree_DiffpanelHeight = 16
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_HelpLine = 0
    end
}
