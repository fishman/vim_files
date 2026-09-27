return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp', -- Optional: For using slash commands and variables in the chat buffer
      'nvim-telescope/telescope.nvim', -- Optional: For using slash commands
      { 'stevearc/dressing.nvim', opts = {} }, -- Optional: Improves `vim.ui.select`
      'ravitemer/codecompanion-history.nvim',
    },
    config = function()
      require('codecompanion').setup {
        extensions = {
          history = {
            enabled = true,
            -- Optional: Set the maximum number of history entries to keep
            max_entries = 100,
            -- Optional: Set the path to store the history file (default is ~/.local/share/nvim/codecompanion_history.json)
            history_file_path = vim.fn.stdpath 'data' .. '/codecompanion_history.json',
          },
        },
        adapters = {
          http = {
            anthropic = function()
              return require('codecompanion.adapters').extend('anthropic', {
                -- url = 'https://api.z.ai/api/anthropic/v1/messages',
                url = 'https://api.deepseek.com/anthropic/v1/messages',
                env = {
                  -- api_key = 'cmd:pass llm/zai',
                  api_key = 'cmd:pass llm/deepseek',
                },
              })
            end,
            deepseek = function()
              return require('codecompanion.adapters').extend('deepseek', {
                env = {
                  api_key = 'cmd:pass llm/deepseek',
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
            acp = {
              claude_code = function()
                return require('codecompanion.adapters').extend('claude_code', {
                  env = {
                    ANTHROPIC_BASE_URL = 'https://api.deepseek.com/anthropic',
                    ANTHROPIC_AUTH_TOKEN = 'cmd:pass llm/deepseek',
                    ANTHROPIC_MODEL = 'deepseek-v4-pro[1m]',
                    ANTHROPIC_DEFAULT_OPUS_MODEL = 'deepseek-v4-pro[1m]',
                    ANTHROPIC_DEFAULT_SONNET_MODEL = 'deepseek-v4-pro[1m]',
                    ANTHROPIC_DEFAULT_HAIKU_MODEL = 'deepseek-v4-flash',
                    CLAUDE_CODE_SUBAGENT_MODEL = 'deepseek-v4-flash',
                    CLAUDE_CODE_EFFORT_LEVEL = 'max',
                    CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC = '1',
                  },
                })
              end,
            },
            openrouter = function()
              return require('codecompanion.adapters').extend('openai_compatible', {
                env = {
                  url = 'https://openrouter.ai/api',
                  api_key = 'cmd:pass llm/openrouter',
                  chat_url = '/v1/chat/completions',
                },
                handlers = {
                  parse_message_meta = function(self, data)
                    local extra = data.extra
                    if extra and extra.reasoning then
                      data.output.reasoning = { content = extra.reasoning }
                      if data.output.content == '' then
                        data.output.content = nil
                      end
                    end
                    return data
                  end,
                },
              })
            end,
          },
        },
        strategies = {
          chat = {
            adapter = 'deepseek',
          },
          inline = {
            adapter = 'deepseek',
          },
          agent = {
            adapter = 'deepseek',
          },
        },
        interactions = {
          chat = {
            -- adapter = 'claude_code',
            adapter = 'deepseek',
          },
        },
        prompt_library = {
          ['email-rephrase'] = {
            strategy = 'chat',
            description = 'Rephrase the email in the current buffer',
            opts = {
              is_slash_cmd = true,
              short_name = 'email-rephrase',
            },
            prompts = {
              {
                role = 'user',
                content = function(context)
                  local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)
                  return 'Rephrase the email below to be more concise and professional. '
                    .. 'Keep the meaning, intent, and tone. Remove wordiness and filler. '
                    .. 'Keep it under 200 words. Output only the rewritten email, no commentary.\n\n'
                    .. table.concat(lines, '\n')
                end,
              },
            },
          },
          ['email-improve'] = {
            strategy = 'chat',
            description = 'Improve the email in the current buffer',
            opts = {
              is_slash_cmd = true,
              short_name = 'email-improve',
            },
            prompts = {
              {
                role = 'user',
                content = function(context)
                  local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)
                  return 'Improve the email below: strengthen the call to action, '
                    .. 'make the value proposition clearer, and fix awkward phrasing. '
                    .. 'Keep the same sender voice and structure. '
                    .. 'Output only the improved email, no commentary.\n\n'
                    .. table.concat(lines, '\n')
                end,
              },
            },
          },
          ['email-brief'] = {
            strategy = 'chat',
            description = 'Make the email in the current buffer brief',
            opts = {
              is_slash_cmd = true,
              short_name = 'email-brief',
            },
            prompts = {
              {
                role = 'user',
                content = function(context)
                  local lines = vim.api.nvim_buf_get_lines(context.bufnr, 0, -1, false)
                  return 'Make the email below brief: cut it to the essential message '
                    .. 'in as few words as possible without losing the point. '
                    .. 'No filler, no fluff. Output only the brief email, no commentary.\n\n'
                    .. table.concat(lines, '\n')
                end,
              },
            },
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
  {
    'carderne/pi-nvim',
    config = function()
      require('pi-nvim').setup {
        thinking = false,
      }
      vim.keymap.set('n', '<leader>pp', ':PiSend<CR>', { desc = 'Send to Pi' })
      vim.keymap.set('n', '<leader>pt', ':PiSendFile<CR>', { desc = 'Send file to Pi' })
      vim.keymap.set('v', '<leader>ps', ':PiSendSelection<CR>', { desc = 'Send selection to Pi' })
      vim.keymap.set('n', '<leader>pb', ':PiSendBuffer<CR>', { desc = 'Send buffer to Pi' })
      vim.keymap.set('n', '<leader>pi', ':PiPing<CR>', { desc = 'Ping Pi' })
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    dependencies = { 'copilotlsp-nvim/copilot-lsp' },
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        help = true,
        javascript = true,
        typescript = true,
        ['*'] = false,
      },
    },
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

  -- {
  --   'yetone/avante.nvim',
  --   event = 'VeryLazy',
  --   lazy = false,
  --   version = false, -- set this if you want to always pull the latest change
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  -- },
}
