-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    arrow_closed = ">",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}
local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")

if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
-- OR setup with some options
nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "options" }, cb = tree_cb "edit" },
        { key = "u", action = "dir_up" },
        { key = "h", cb = tree_cb, action = "close_node" },
        { key = "v", cb = tree_cb, action = "vsplit" },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = icons
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
})
