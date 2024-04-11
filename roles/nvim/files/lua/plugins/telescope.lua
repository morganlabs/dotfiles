return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  keys = {
    { "<C-p>", ":lua Project_files()<CR>" },
    { "<C-g>", ":lua require('telescope.builtin').live_grep()<CR>" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules", ".git", "LICENSE", "README", "*-lock",
          "*.lock"
        },
      }
    })

    local is_inside_work_tree = {}

    local function is_git_repo()
      local cwd = vim.fn.getcwd()
      if is_inside_work_tree[cwd] == nil then
        vim.fn.system("git rev-parse --is-inside-work-tree")
        is_inside_work_tree[cwd] = vim.v.shell_error == 0
      end

      return is_inside_work_tree
    end

    -- Find all git files (including untracked) from `.git` root,
    -- if not found, find all files
    function Project_files()
      local opts = { show_untracked = true }
      local cwd = vim.fn.getcwd()
      is_git_repo()

      if is_inside_work_tree[cwd] then
        builtin.git_files(opts)
      else
        builtin.find_files(opts)
      end
    end
  end
}
