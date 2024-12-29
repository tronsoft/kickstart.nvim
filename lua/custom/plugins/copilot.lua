return {
	{
	  -- Rest of your configuration
	  {
		  "zbirenbaum/copilot.lua",
		  cmd = "Copilot",
		  event = "InsertEnter",
	  },
	},
	{
	  -- Rest of your Plugins
	  {
		  "zbirenbaum/copilot-cmp",
		  config = function()
		  require("copilot_cmp").setup()
		  end,
	  },
	}
}

