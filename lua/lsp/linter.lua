require('lint').linters_by_ft = {
  python = {'pylint'},
  lua = {'luacheck'}
}

-- Trigger linter
vim.api.nvim_create_autocmd({ "BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
