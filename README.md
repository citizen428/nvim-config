# Neovim config

A Neovim configuration with a focus on leveraging Neovim-specific features and its Lua API.

Some used plugins:

* [packer.nvim](https://github.com/wbthomason/packer.nvim): plugin management
* [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua): file explorer
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): status line
* [NVim LSP](https://neovim.io/doc/user/lsp.html), [nvim-compe](https://github.com/hrsh7th/nvim-compe),
    [vim-vsnip](https://github.com/hrsh7th/vim-vsnip): LSP support and autocompletion
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): better syntax highlighting
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): fuzzy finding

## Screenshots

Editing Lua with [NeovimTree](https://github.com/kyazdani42/nvim-tree.lua) open and a document symbols view provided by the language server.

![Screenshot](screenshots/screenshot1.png)

## Notes

* Wherever possible I try to use Lua plugins.
* I also try to keep as much of the configuration as possible in Lua, but there are still a lot of `vim.cmd` blocks around.
* I'm not really a fan of syntax highlighting, so I use the [Nofrils](https://github.com/robertmeta/nofrils) theme.

## Inspiration

* [Optixal's init.vim](https://github.com/Optixal/neovim-init.vim/)
* [Neovim LSP, DAP and Fuzzy Finder](https://medium.com/swlh/neovim-lsp-dap-and-fuzzy-finder-60337ef08060)
* [Neovim — init.lua](https://alpha2phi.medium.com/neovim-init-lua-e80f4f136030)
* [richin13's init.vim](https://github.com/richin13/dotfiles/blob/develop/dotfiles/.config/nvim/init.vim)
* [LunarVim's Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch/)
