local which_key = require "which-key"
local builtin = require('telescope.builtin')

local telescope_mappings = {
  f = {
    name = "Find",
    f = { builtin.find_files, "Find files" },
    g = { builtin.git_files, "Find git files" },
    l = { builtin.live_grep, "Live grep" },
  },
}

which_key.register(telescope_mappings, { prefix = "<leader>" })
