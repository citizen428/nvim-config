-- vim:foldmethod=marker:foldlevel=0

-- Imports and local helpers {{{
local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  print("Attaching LSP: " .. client.name)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- }}}

-- Solargraph {{{
lspconfig.solargraph.setup {
  settings = {solargraph = {diagnostics = true, completion = true}},

  on_attach = on_attach
}

--}}}

-- Lua {{{
lspconfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim", "use"},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}

--}}}

-- {{{ JS / TypeScript
lspconfig.tsserver.setup {}

-- }}}

-- {{{ Rust
lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehavior = "last",
        importPrefix = "by_self",
      },
      cargo = {loadOutDirsFromCheck = true},
      procMacro = {enable = true},
    }
  },

  on_attach = on_attach
}

-- }}}

-- {{{ Go
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },

  on_attach = on_attach,
}
-- }}}
