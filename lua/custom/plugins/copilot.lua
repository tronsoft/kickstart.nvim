return {
  {
    -- Rest of your configuration
    {
      'zbirenbaum/copilot.lua',
      cmd = 'Copilot',
      event = 'InsertEnter',
      config = function()
        require('copilot').setup {
          suggestion = {
            auto_trigger = true,
          },
        }
      end,
    },
  },
  {
    -- Rest of your Plugins
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require('copilot_cmp').setup()

        vim.keymap.set('n', '<leader>ct', function()
          require('copilot.suggestion').toggle_auto_trigger()
        end, { desc = 'Toggle Copilot suggestion' })
      end,
    },
  },
}
