return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.3',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "sharkdp/fd",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
        prompt_prefix = '   ',
        file_ignore_patterns = { '.git/', 'vendor/', 'node_modules/' },
        mappings = {
          i = {
            ["<esc>"] = actions.close, -- close window with a single esc press vs 2
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          previewer = false,
          layout_config = {
            width = 80,
          },
        },
        oldfiles = {
          prompt_title = 'History',
        },
        lsp_references = {
          previewer = false,
        },
        lsp_definitions = {
          previewer = false,
        },
        lsp_document_symbols = {
          symbol_width = 55,
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps

    vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>F", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Fuzzy find all files in cwd" })
    vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Find all open buffers" })
    vim.keymap.set("n", "<leader>h", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>g", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
  end,
}
