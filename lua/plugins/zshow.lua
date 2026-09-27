---@type zpack.Spec
return {
  'sairyy/zshow.nvim',
  -- uncomment the line above and comment the one below for the GitHub mirror
  -- src = 'https://gitlab.com/sairy/zpack.nvim',
  lazy = false, -- no need for lazy loading
  init = function()
    vim.g.zshow_opts = {
      -- your config here
    }
  end,
}
