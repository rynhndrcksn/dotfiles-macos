return {
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.keymap.set("n", "<leader>0", ":FloatermToggle<CR>", { desc = "Open Floaterm terminal" })
    vim.keymap.set("t", "<leader>0", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "Close Floaterm terminal" })
  end,
}
