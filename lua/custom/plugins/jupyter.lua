return {
  {
    'benlubas/molten-nvim',
    build = ':UpdateRemotePlugins',
    dependencies = {
      '3rd/image.nvim', -- Optional: Inline image support
      'MunifTanjim/nui.nvim', -- UI support
      'rcarriga/nvim-notify', -- Notification support
    },
    config = function()
      vim.g.molten_image_provider = 'image.nvim' -- Enable inline images
      vim.g.molten_output_win_max_height = 20 -- Set output window height
      vim.g.molten_virt_text_output = true -- Show output inline
      vim.g.molten_virt_lines_off_by_1 = true -- Fix misalignment
    end,
    init = function()
      vim.keymap.set('n', '<leader>mi', ':MoltenInit<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>mm', ':MoltenEvaluateOperator<CR>', { noremap = true, silent = true })
      vim.keymap.set('v', '<leader>mm', ':MoltenEvaluateVisual<CR>', { noremap = true, silent = true })
    end,
  },
}
