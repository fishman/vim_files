-- ./lua/plugins/fundo.lua
return {
  'kevinhwang91/nvim-fundo',
  dependencies = { 'kevinhwang91/promise-async' },
  cond = not vim.g.vscode,
  version = 'main',
  build = function()
    require('fundo').install()
  end,
  opts = {},
  config = function(_, opts)
    vim.o.undofile = true
    require('fundo').setup(opts)
  end,
}
