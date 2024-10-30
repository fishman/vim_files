return {
  {
    'kcl-lang/kcl.nvim',
    ft = {
      'kcl',
    },
  },
  {
    'Ramilito/kubectl.nvim',
    setup = function()
      require('kubectl').setup {}
      vim.keymap.set('n', '<leader>k', '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })
    end,
  },
}
