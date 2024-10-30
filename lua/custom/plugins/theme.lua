return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = {
      'AndreM222/copilot-lualine',
    },
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        -- component_separators = '|',
        -- section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          },
        },
        lualine_c = { 'filename' },
        lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' }, -- I added copilot here
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
    -- init = function()
    --   local M = require('lualine.component'):extend()
    --
    --   M.processing = false
    --   M.spinner_index = 1
    --
    --   local spinner_symbols = {
    --     '⠋',
    --     '⠙',
    --     '⠹',
    --     '⠸',
    --     '⠼',
    --     '⠴',
    --     '⠦',
    --     '⠧',
    --     '⠇',
    --     '⠏',
    --   }
    --   local spinner_symbols_len = 10
    --
    --   -- Initializer
    --   function M:init(options)
    --     M.super.init(self, options)
    --
    --     local group = vim.api.nvim_create_augroup('CodeCompanionHooks', {})
    --
    --     vim.api.nvim_create_autocmd({ 'User' }, {
    --       pattern = 'CodeCompanionRequest*',
    --       group = group,
    --       callback = function(request)
    --         if request.match == 'CodeCompanionRequestStarted' then
    --           self.processing = true
    --         elseif request.match == 'CodeCompanionRequestFinished' then
    --           self.processing = false
    --         end
    --       end,
    --     })
    --   end
    --
    --   -- Function that runs every time statusline is updated
    --   function M:update_status()
    --     if self.processing then
    --       self.spinner_index = (self.spinner_index % spinner_symbols_len) + 1
    --       return spinner_symbols[self.spinner_index]
    --     else
    --       return nil
    --     end
    --   end
    --
    --   return M
    -- end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
