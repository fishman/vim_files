return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 900, -- Ensure it loads first
    dependencies = {
      'Mofiqul/vscode.nvim',
      'rafamadriz/neon',
      { 'catppuccin/nvim', name = 'catppuccin' },
      'yorik1984/newpaper.nvim',
    },
    config = function()
      local hour = tonumber(os.date '%H')
      if hour < 6 then
        vim.opt.background = 'dark'
        vim.cmd.colorscheme 'tokyonight-night'
      elseif hour < 17 then
        vim.opt.background = 'light'
        -- vim.cmd.colorscheme 'newpaper'
        vim.cmd.colorscheme 'tokyonight-day'
      else
        vim.opt.background = 'dark'
        vim.cmd.colorscheme 'tokyonight-storm'
      end
    end,
    -- init = function()
    --   local function set_theme_from_darkman()
    --     if vim.fn.executable 'darkman' == 1 then
    --       local darkman_status = vim.fn.system('darkman get'):gsub('%s+', '')
    --
    --       if darkman_status == 'dark' then
    --         vim.o.background = 'dark'
    --         vim.cmd 'colorscheme onedark'
    --       else
    --         vim.o.background = 'light'
    --         vim.cmd 'colorscheme neon'
    --       end
    --     end
    --   end
    --
    --   set_theme_from_darkman()
    --
    --   local function set_theme()
    --     if vim.o.background == 'dark' then
    --       vim.cmd 'colorscheme onedark'
    --       -- require('lualine').setup { options = { theme = 'onedark' } }
    --     else
    --       vim.cmd 'colorscheme neon'
    --       -- require('lualine').setup { options = { theme = 'onedark' } }
    --       -- vim.cmd [[highlight IndentBlanklineChar guifg=#3b4048 gui=nocombine]]
    --       -- vim.cmd [[highlight IndentBlanklineContextChar guifg=#5c6370 gui=nocombine]]
    --
    --       -- Force indent-blankline refresh
    --       -- vim.cmd [[IndentBlanklineRefresh]]
    --     end
    --   end
    --
    --   vim.api.nvim_create_autocmd('OptionSet', {
    --     pattern = 'background',
    --     callback = set_theme,
    --   })
    -- end,
  },
  -- {
  --   '4e554c4c/darkman.nvim',
  --   build = 'go build -o bin/darkman.nvim',
  --   config = function()
  --     require('darkman').setup {
  --       colorscheme = { dark = 'onedark', light = 'neon' },
  --     }
  --   end,
  -- },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = {
      'AndreM222/copilot-lualine',
    },
    opts = {
      options = {
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
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
        lualine_x = { 'copilot', 'encoding', 'filetype' }, -- I added copilot here
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
