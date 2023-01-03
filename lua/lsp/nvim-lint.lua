require('lint').linters_by_ft = {
  python = {'pylint'},
  lua = {'luacheck'},
}

vim.api.nvim_create_autocmd({"BufwritePost"}, {
  callback = function()
      require("lint").try_lint()
    end,
  })

