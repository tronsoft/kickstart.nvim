return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "Issafalcon/neotest-dotnet", version = "*" },
    { "fredrikaverpil/neotest-golang", version = "*" },
  },
  config = function()
    local neotest_golang_opts = {}  -- Specify custom configuration
    require("neotest").setup({
      adapters = {
        require("neotest-dotnet"),
        require("neotest-golang")(neotest_golang_opts), -- Registration
      }
    })
  end,
}
