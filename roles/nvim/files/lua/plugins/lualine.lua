return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local line = require('lualine')

        line.setup({
            options = {
                theme = 'pywal-nvim',
                section_separators = { left = ' ', right = ' ' },
                component_separators = { left = '|', right = '|' }
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { 'filename' },

                lualine_x = { {
                    'diagnostics',
                    sources = { "nvim_lsp" },
                    sections = { 'error', 'warn' },
                    diagnostics_color = {
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    },
                    symbols = { error = 'E', warn = 'W' },
                    colored = false,         -- Displays diagnostics status in color if set to true.
                    update_in_insert = true, -- Update diagnostics in insert mode.
                    always_visible = true,   -- Show diagnostics even if there are none.
                } },
                lualine_y = { 'encoding', 'filetype' },
                lualine_z = { 'location' }
            }
        })
    end
}
