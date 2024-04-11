return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	config = function()
		local line = require("lualine")

		line.setup({
			options = {
				theme = "horizon",
				section_separators = { left = " ", right = " " },
				component_separators = { left = "|", right = "|" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },

				lualine_x = {
					"copilot",
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						sections = { "error", "warn" },
						diagnostics_color = {
							error = "DiagnosticError",
							warn = "DiagnosticWarn",
						},
						symbols = { error = "E", warn = "W" },
						colored = false,
						update_in_insert = true,
						always_visible = true,
					},
				},
				lualine_y = { "encoding", "filetype" },
				lualine_z = { "location" },
			},
		})
	end,
}
