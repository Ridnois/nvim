local telescope_status_ok, telescope = pcall(require, "telescope")

if not telescope_status_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".git/", "^node_modules/" }
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end,
    }
  }
})
