local telescope = require("telescope")

telescope.setup{
  pickers = {
    find_files = {
      hidden = true,
      theme = "dropdown"
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    },
  }
}
