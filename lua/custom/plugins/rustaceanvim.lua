return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  ["rust-analyzer"] = {
    cargo = {
      all_features = true,
    },
  },
  config = function()
    vim.g.rustaceanvim = function()
      -- Update this path
      local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.11.4/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb'
      local this_os = vim.uv.os_uname().sysname;
  
      -- The path is different on Windows
      if this_os:find "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
      else
        -- The liblldb extension is .so for Linux and .dylib for MacOS
        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
      end
  
      local cfg = require('rustaceanvim.config')
      return {
        -- server = {
        --   cmd = function()
        --     local mason_registry = require('mason-registry')
        --     if mason_registry.is_installed('rust-analyzer') then
        --       -- This may need to be tweaked depending on the operating system.
        --       local ra = mason_registry.get_package('rust-analyzer')
        --       local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
        --       return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
        --     else
        --       -- global installation
        --       return { 'rust-analyzer' }
        --     end
        --   end,
        -- },
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  end,
}
