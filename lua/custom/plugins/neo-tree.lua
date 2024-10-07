-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\\\', ':Neotree toggle<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>ff', ':Neotree filesystem reveal left<CR>', desc = 'NeoTree Find File', silent = true },
  },
  opts_extend = { 'sources' },
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      use_libuv_file_watcher = true,
    },
    window = {
      -- auto_expand_width = true,
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['\\\\'] = 'close_window',
        ['<space>'] = 'none',
        ['A'] = 'git_add_all',
        ['ga'] = 'git_add_file',
        ['gu'] = 'git_unstage_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          desc = 'Copy Path to Clipboard',
        },
        ['O'] = {
          function(state)
            require('lazy.util').open(state.tree:get_node().path, { system = true })
          end,
          desc = 'Open with System Application',
        },
        ['P'] = { 'toggle_preview', config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
    },
  },
}
