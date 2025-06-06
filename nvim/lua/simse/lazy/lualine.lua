return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      theme = "horizon",
      sections = {
        lualine_x = { "overseer" },
      },
    })
  end
};
