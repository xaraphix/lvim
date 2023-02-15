
-- RUST CONF

-- rust-tools
--
-- Update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'  -- MacOS: This may be .dylib


require("rust-tools").setup({
  tools = {
    autoSetHints = true,
    runnables = {
      use_telescope = true,
    },
  },
  server = {
    cmd = { "/home/suyash/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/rust-analyzer" },
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
  },
 dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
})


