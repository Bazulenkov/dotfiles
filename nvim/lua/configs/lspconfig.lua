-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()


local servers = {
  html = {},
  cssls = {},
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            -- ignore = {'W391'},
            maxLineLength = 88,
          },
        },
      },
    },
  },
  ruff = {},
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, opts in pairs(servers) do
  -- lsps with default config
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  require("lspconfig")[name].setup(opts)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
