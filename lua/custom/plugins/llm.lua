return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
      'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require('codecompanion').setup {
        adapters = {
          anthropic = function()
            return require('codecompanion.adapters').extend('anthropic', {
              env = {
                api_key = 'cmd:pass llm/claude',
              },
            })
          end,
          ollama = require('codecompanion.adapters').extend('ollama', {
            schema = {
              model = {
                default = 'deepscaler',
                -- default = 'deepseek-coder:6.7b',
                choices = {},
              },
            },
          }),
        },
        strategies = {
          -- chat = {
          --   adapter = 'ollama',
          -- },
          -- inline = {
          --   adapter = 'ollama',
          -- },
          -- agent = {
          --   adapter = 'ollama',
          -- },
          chat = {
            adapter = 'anthropic',
          },
          inline = {
            adapter = 'copilot',
          },
          agent = {
            adapter = 'anthropic',
          },
        },
      }

      vim.api.nvim_set_keymap('v', '<LocalLeader>cc', '', {
        callback = function()
          require('codecompanion').prompt 'explain'
        end,
        noremap = true,
        silent = true,
      })
      vim.api.nvim_set_keymap('v', '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<LocalLeader>ta', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', '<LocalLeader>ta', '<cmd>CodeCompanionChat Toggle<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', 'ga', '<cmd>CodeCompanionChat Add<cr>', { noremap = true, silent = true })

      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd [[cab cc CodeCompanion]]
    end,
  },
  -- {
  --   'pasky/claude.vim',
  --   config = function()
  --     vim.g.claude_api_key = 'helloworld'
  --   end,
  -- },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   branch = 'canary',
  --   dependencies = {
  --     { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
  --     { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
  --   },
  --   build = 'make tiktoken', -- Only on MacOS or Linux
  --   opts = {
  --     debug = false, -- Enable debugging
  --     -- See Configuration section for rest
  --   },
  --   -- See Commands section for default commands if you want to lazy load on them
  -- },
  --

  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = 'make',
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'zbirenbaum/copilot.lua', -- for providers='copilot'
      {
        -- support for image pasting
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,

            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  {
    'GeorgesAlkhouri/nvim-aider',
    aider_cmd = 'aider',
    args = {
      '--no-auto-commits',
      '--pretty',
      '--stream',
    },
    -- Example key mappings for common actions:
    keys = {
      { '<leader>a/', '<cmd>Aider toggle<cr>', desc = 'Toggle Aider' },
      { '<leader>as', '<cmd>Aider send<cr>', desc = 'Send to Aider', mode = { 'n', 'v' } },
      { '<leader>ac', '<cmd>Aider command<cr>', desc = 'Aider Commands' },
      { '<leader>ab', '<cmd>Aider buffer<cr>', desc = 'Send Buffer' },
      { '<leader>a+', '<cmd>Aider add<cr>', desc = 'Add File' },
      { '<leader>a-', '<cmd>Aider drop<cr>', desc = 'Drop File' },
      { '<leader>ar', '<cmd>Aider add readonly<cr>', desc = 'Add Read-Only' },
      { '<leader>aR', '<cmd>Aider reset<cr>', desc = 'Reset Session' },
      -- Example nvim-tree.lua integration if needed
      { '<leader>a+', '<cmd>AiderTreeAddFile<cr>', desc = 'Add File from Tree to Aider', ft = 'NvimTree' },
      { '<leader>a-', '<cmd>AiderTreeDropFile<cr>', desc = 'Drop File from Tree from Aider', ft = 'NvimTree' },
    },
    dependencies = {
      'folke/snacks.nvim',
      --- The below dependencies are optional
      'catppuccin/nvim',
      'nvim-tree/nvim-tree.lua',
      --- Neo-tree integration
      {
        'nvim-neo-tree/neo-tree.nvim',
        opts = function(_, opts)
          -- Example mapping configuration (already set by default)
          -- opts.window = {
          --   mappings = {
          --     ["+"] = { "nvim_aider_add", desc = "add to aider" },
          --     ["-"] = { "nvim_aider_drop", desc = "drop from aider" }
          --     ["="] = { "nvim_aider_add_read_only", desc = "add read-only to aider" }
          --   }
          -- }
          require('nvim_aider.neo_tree').setup(opts)
        end,
      },
    },
    config = true,
  },
}
