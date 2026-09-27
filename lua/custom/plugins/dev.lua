return {
  -- { 'fishman/movelang.nvim', dev = true, dependencies = { 'nvim-treesitter/nvim-treesitter' }, opts = {} },
  -- { 'fishman/movelang.nvim', dev = true, dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  {
    'delphinus/md-render.nvim',
    version = '*',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', version = '*' }, -- optional: file type icons in code blocks
      { 'delphinus/budoux.lua', version = '*' }, -- optional: CJK phrase-level line breaking
    },
    keys = {
      { '<leader>mp', '<Plug>(md-render-preview)', desc = 'Markdown preview (toggle)' },
      { '<leader>mt', '<Plug>(md-render-preview-tab)', desc = 'Markdown preview in tab (toggle)' },
      { '<leader>md', '<Plug>(md-render-demo)', desc = 'Markdown render demo' },
    },
  },
  {
    '3rd/image.nvim',
    opts = {
      backend = 'sixel',
      -- backend = 'kitty',
      integrations = {
        markdown = {
          enabled = true,
          download_remote_images = false,
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = 'inline',
        },
      },
    },
  },
  { 'MeanderingProgrammer/render-markdown.nvim', dependencies = {
    '3rd/image.nvim',
  } },
  {
    'emrearmagan/atlas.nvim',
    dependencies = {
      'MeanderingProgrammer/render-markdown.nvim', -- optional but recommended (Jira)
      'sindrets/diffview.nvim', -- optional (PullRequest diff)
      'esmuellert/codediff.nvim', -- optional (PullRequest diff alternative)
    },
    config = function()
      require('atlas').setup {
        pulls = {
          providers = {
            bitbucket = {}, -- See configuration below
            github = {}, -- See configuration below
          },
        },
        issues = {
          providers = {
            jira = {}, -- See configuration below
          },
        },
      }
    end,
  },
  {
    'vieitesss/command.nvim',
    lazy = false,
    version = '*',
    opts = {},
  },
  { 'mvaldes14/terraform.nvim' },

  {
    'yutanagano/smark.nvim',
    ft = { 'markdown', 'text' },
    --Below are the default settings for the available options. You can omit
    --the opts table below and simply set config = true if you are happy with
    --the default settings.
    opts = {
      --Keymapping settings for list action commands.
      --Set to false to disable.
      mappings = {
        --Format the current list block to be clean / correct.
        format_list = '<leader>lf',
        --Switch between ordered / unordered list types.
        toggle_ordered = '<leader>lo',
        --Toggle the completion status of a task list item.
        toggle_completion = '<leader>lx',
        --Toggle between plain and task list items.
        toggle_task = '<leader>lt',
      },

      --Following the starting line of a list item, only contiguous lines that
      --start with at least one whitespace character can be considered as part of
      --a multi-line list item.
      multiline_requires_whitespace = false,
    },
  },
}
