-- ensure Packer is present
local nvim_command = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
local repo = "https://github.com/wbthomason/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  nvim_command("!git clone "..repo.." "..install_path)
  nvim_command("packadd packer.nvim")
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use {"wbthomason/packer.nvim", opt = true}

  -- Sensible defaults
  use "tpope/vim-sensible"

  -- Aesthetics
  use "jonathanfilip/vim-lucius"
  use {
    "glepnir/galaxyline.nvim",
    requires = {{"kyazdani42/nvim-web-devicons"}}
  }

  -- LSP and auto-completion
  use "neovim/nvim-lspconfig"
  use {
    "haorenW1025/completion-nvim",
    requires = {
      {"hrsh7th/vim-vsnip"},
      {"hrsh7th/vim-vsnip-integ"},
      {"steelsojka/completion-buffers"}
    }
  }

  -- File explorer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {{"kyazdani42/nvim-web-devicons"}}
  }

  -- Fuzzy finding
  use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }

  -- Better syntax highlighting
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- Developemnt
  use "chrisbra/Colorizer"
  use "mattn/emmet-vim"
  use "rhysd/clever-f.vim"
  use "scrooloose/nerdcommenter"
  use "tjdevries/nlua.nvim"
  use "tpope/vim-fugitive"
  use "tpope/vim-rails"
  use "vim-test/vim-test"

  use "yuezk/vim-js"
  use 'maxmellon/vim-jsx-pretty'

  -- Useful utilities
  use {
    "tpope/vim-dispatch",
    opt = true,
    cmd = {"Dispatch", "Make", "Focus", "Start"}
  }

  use { "junegunn/rainbow_parentheses.vim", opt = true }

  use "907th/vim-auto-save"
  use "jiangmiao/auto-pairs"
  use "kassio/neoterm"
  use "mbbill/undotree"
  use "mhinz/vim-grepper"
  use "tpope/vim-surround"
  use "junegunn/vim-easy-align"
  use "Yggdroot/indentLine"
end)
