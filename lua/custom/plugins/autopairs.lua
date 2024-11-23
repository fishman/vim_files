-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    npairs.setup {
      check_ts = true,
      ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
        java = false, -- don't check treesitter on java
      },
    }

    local ts_conds = require 'nvim-autopairs.ts-conds'

    -- press % => %% only while inside a comment or string
    npairs.add_rules {
      Rule('%', '%', 'lua'):with_pair(ts_conds.is_ts_node { 'string', 'comment' }),
      Rule('$', '$', 'lua'):with_pair(ts_conds.is_not_ts_node { 'function' }),
    }
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
