return {
  {
    'mgierada/lazydocker.nvim',
    dependencies = { 'akinsho/toggleterm.nvim' },
    config = function()
      require('lazydocker').setup {}

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'double',
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
      }

      function LazygitToggle()
        lazygit:toggle()
      end

      vim.keymap.set('n', '<leader>og', '<cmd>lua LazygitToggle()<CR>', { desc = 'Open Lazygit' })
      vim.keymap.set('n', '<leader>ot', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { desc = 'Open Terminal' })
      vim.api.nvim_create_autocmd('TermEnter', {
        pattern = 'term://*toggleterm#*',
        callback = function()
          vim.api.nvim_buf_set_keymap(0, 't', '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
        end,
      })
    end,
    event = 'BufRead', -- or any other event you might want to use.
  },
}
