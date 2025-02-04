return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'princejoogie/dir-telescope.nvim'
  },
  config = function()
    require('telescope').setup({})
    require("dir-telescope").setup({})
  end
}
