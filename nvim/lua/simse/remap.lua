local which_key = require "which-key"
-- local builtin = require('telescope.builtin')

local telescope_mappings = {
  { "<leader>f", group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
  { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
}

which_key.add(telescope_mappings, { prefix = "<leader>" })
