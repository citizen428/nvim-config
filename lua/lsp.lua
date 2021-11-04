-- vim:foldmethod=marker:foldlevel=0

-- Imports and local helpers {{{
local lspconfig = require("lspconfig")

local home = vim.fn.expand("$HOME")

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
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = home .. "/src/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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
lspconfig.rust_analyzer.setup({
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
})

-- }}}

