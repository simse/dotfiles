return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'princejoogie/dir-telescope.nvim',
    -- 'nvim-telescope/telescope-file-browser.nvim'
  },
  config = function()
    require('telescope').setup({})
    require("dir-telescope").setup({})

    -- require("telescope").load_extension "file_browser"
    require("telescope").load_extension "dir"
  end
}
