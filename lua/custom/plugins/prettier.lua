return {
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      vim.g.lazyvim_prettier_needs_config = false
      vim.keymap.set("n", "<leader>df", function () require('conform').format() end, { desc = "Format document" })
    end
  }
}
