return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      tab_size = 0,
      max_name_length = 25,
      offsets = {
        {
         filetype = 'NvimTree',
          text = '  Files',
          highlight = 'StatusLine',
          text_align = 'left',
        },
      },
      mode = "tabs",
      -- separator_style = "slant",
    },
  },
}
