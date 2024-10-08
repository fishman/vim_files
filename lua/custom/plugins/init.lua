-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'tiagovla/scope.nvim', opts = {} },
  -- 'dense-analysis/ale',
  'roxma/vim-tmux-clipboard',
  'tmux-plugins/vim-tmux-focus-events',
  -- 'jlcrochet/vim-ruby',
  'westeri/asl-vim',
  'vimwiki/vimwiki',
  'tools-life/taskwiki',
  'michal-h21/vimwiki-sync',
  {
    'pasky/claude.vim',
    config = function()
      vim.g.claude_api_key = 'helloworld'
    end,
  },
  -- 'sheerun/vim-polyglot',
  -- 'bfredl/nvim-ipy',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- tpope language plugins
  {
    'tpope/vim-rails',
    config = function()
      vim.api.nvim_create_autocmd('FileType', { pattern = 'eruby.yaml', command = 'set filetype=yaml' })
    end,
  },
  'preservim/tagbar',
  'tpope/vim-rake',
  'tpope/vim-vinegar',
  'tpope/vim-bundler',
  'echasnovski/mini.move',
  '0xmovses/move.vim',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.

  {
    'kcl-lang/kcl.nvim',
    ft = {
      'kcl',
    },
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end,
    init = function()
      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(filetype, option)
        return option == 'commentstring' and require('ts_context_commentstring.internal').calculate_commentstring() or get_option(filetype, option)
      end
    end,
  },
  {
    'luckasRanarison/nvim-devdocs',
    opts = {},
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    init = function()
      vim.keymap.set('n', '<leader>do', ':DevdocsOpen<cr>', { desc = '[D]evdocs [O]pen', silent = true, noremap = true })
      vim.keymap.set('n', '<leader>di', ':DevdocsInstall<cr>', { desc = '[D]evdocs [I]nstall', silent = true, noremap = true })
      vim.keymap.set('n', '<leader>dg', ':DogeGenerate<cr>', { desc = '[D]ocstring [G]enerate', silent = true, noremap = true })
    end,
  },
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    event = 'VeryLazy',
    config = function()
      -- Load treesitter grammar for org
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/org/roam/*',
        org_default_notes_file = '~/org/refile.org',
      }
    end,
  },
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', --optional
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    branch = 'regexp', -- This is the regexp branch, use this for the new version
    config = function()
      require('venv-selector').setup()
    end,
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      modes = {
        lsp = {
          win = { position = 'right' },
        },
      },
    },
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        ignore_lsp = { 'texlab' },
        scope_chdir = 'tab',
      }
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {},
  },
  {
    'kkoomen/vim-doge',
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },

  {
    'vim-test/vim-test',
    config = function()
      vim.api.nvim_command 'let test#strategy = "neovim"'
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'cuducos/yaml.nvim',
    ft = { 'yaml' }, -- optional
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
    },
  },
}
