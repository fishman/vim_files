-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  },
  keys = {
    { '\\\\', ':NvimTreeToggle<CR>', desc = 'Toggle file explorer' },
    { '<leader>ff', ':NvimTreeFindFile<CR>', desc = 'Find File', silent = true },
  },
  -- config with sync_root_with_cwd
  config = function()
    require('nvim-tree').setup {
      -- hijack_netrw = true,
      sync_root_with_cwd = true,
      view = {
        relativenumber = true,
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = 'none',
        root_folder_label = ':t',
        indent_width = 2,
        indent_markers = {
          enable = false,
          inline_arrows = true,
          icons = {
            corner = '└',
            edge = '│',
            item = '│',
            none = ' ',
          },
        },
        special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
        symlink_destination = true,
      },
      update_focused_file = {
        enable = true,
        debounce_delay = 15,
        update_root = true,
        ignore_list = {},
      },

      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
      },
    }
  end,
}
