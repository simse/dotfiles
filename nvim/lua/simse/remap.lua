local which_key = require "which-key"
-- local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }

    local mappings = {
      g = {
        d = { vim.lsp.buf.definition, "Go to definition" },
        l = { vim.diagnostic.open_float, "Open diagnostic float" },
      },
      K = { vim.lsp.buf.hover, "Show hover information" },
      ["<leader>"] = {
        l = {
          name = "LSP",
          a = { vim.lsp.buf.code_action, "Code action" },
          r = { vim.lsp.buf.references, "References" },
          n = { vim.lsp.buf.rename, "Rename" },
          w = { vim.lsp.buf.workspace_symbol, "Workspace symbol" },
          d = { vim.diagnostic.open_float, "Open diagnostic float" },
        },
      },
      ["[d"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
      ["]d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
    }

    which_key.register(mappings, opts)

    vim.keymap.set('n', '<leader>fu', ':lua require("telescope.builtin").lsp_references()<CR>',
      { noremap = true, silent = true })

    -- vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    -- vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
    -- vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
    -- vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    -- vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    -- vim.keymap.set('n', '<leader>lca', function() vim.lsp.buf.code_action() end, opts)
    -- vim.keymap.set('n', '<leader>lrr', function() vim.lsp.buf.references() end, opts)
    -- vim.keymap.set('n', '<leader>lrn', function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

    -- https://www.mitchellhanberg.com/modern-format-on-save-in-neovim/
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = event.data.client_id }
      end
    })

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })
  end,
})

local telescope_mappings = {
  { "<leader>f",  group = "Find" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
  { "<leader>fg", "<cmd>Telescope git_files<cr>",  desc = "Find git files" },
  { "<leader>fl", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
}

which_key.add(telescope_mappings, { prefix = "<leader>" })

vim.keymap.set("n", "<space>fb", function()
  require('oil').open()
end)
