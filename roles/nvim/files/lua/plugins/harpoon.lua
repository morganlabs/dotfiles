local mark = ':lua require("harpoon.mark").'
local ui = ':lua require("harpoon.ui").'

return {
  "ThePrimeagen/harpoon",
  requires = { "nvim-lua/plenary.nvim" },
  lazy = true,
  keys = {
    { "<leader>a", mark .. 'add_file()<CR>' },
    { "<C-y>",     ui .. 'toggle_quick_menu()<CR>' },

    { "<C-h>",     ui .. 'nav_file(1)<CR>' },
    { "<C-j>",     ui .. 'nav_file(2)<CR>' },
    { "<C-k>",     ui .. 'nav_file(3)<CR>' },
    { "<C-l>",     ui .. 'nav_file(4)<CR>' },

    { "<leader>l", ui .. 'nav_next()<CR>' },
    { "<leader>h", ui .. 'nav_prev()<CR>' },
  },
}
