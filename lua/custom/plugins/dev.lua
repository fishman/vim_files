return {
  -- { 'fishman/movelang.nvim', dev = true, dependencies = { 'nvim-treesitter/nvim-treesitter' }, opts = {} },
  -- { 'fishman/movelang.nvim', dev = true, dependencies = { 'nvim-treesitter/nvim-treesitter' } },
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
}
