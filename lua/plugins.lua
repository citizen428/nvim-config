-- ensure Packer is present
local nvim_command = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
local repo = "https://github.com/wbthomason/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  nvim_command("!git clone " .. repo .. " " .. install_path)
  nvim_command("packadd packer.nvim")
end

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  -- Packer can manage itself as an optional plugin
  use {"wbthomason/packer.nvim", opt = true}

  -- Sensible defaults
  use "tpope/vim-sensible"

  -- Aesthetics
  use "shaunsingh/nord.nvim"
  use "YorickPeterse/vim-paper"

  use {
    "nvim-lualine/lualine.nvim",
    requires = {{"kyazdani42/nvim-web-devicons"}}
  }

  -- LSP and auto-completion
  use "neovim/nvim-lspconfig"
  use "nvim-lua/lsp_extensions.nvim"
  use {
    "hrsh7th/nvim-compe",
    requires = {
      {"hrsh7th/vim-vsnip"},
      {"hrsh7th/vim-vsnip-integ"},
    }
  }

  -- File explorer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup {}
    end
  }

  -- Fuzzy finding
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    }
  }

  -- Better syntax highlighting
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  -- Development
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }
  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-gps').setup()
    end
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        "*";
        css = { css_fn = true; }; -- Enable all CSS features: rgb_fn, hsl_fn, etc.
      }
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500
        }
      }
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        mode = "document_diagnostics",
        auto_close = true
      }
    end
  }
  use "blankname/vim-fish"
  use "LnL7/vim-nix"
  use "mattn/emmet-vim"
  use "rhysd/clever-f.vim"
  use "tpope/vim-fugitive"
  use "tpope/vim-rails"
  use "vim-test/vim-test"

  use "tjdevries/nlua.nvim"
  use "yuezk/vim-js"
  use "maxmellon/vim-jsx-pretty"

  -- Useful utilities
  use {
    "tpope/vim-dispatch",
    opt = true,
    cmd = {"Dispatch", "Make", "Focus", "Start"}
  }

  use {"junegunn/rainbow_parentheses.vim", opt = true}

  use "907th/vim-auto-save"
  use "jiangmiao/auto-pairs"
  use "kassio/neoterm"
  use "mbbill/undotree"
  use "tpope/vim-surround"
  use "tversteeg/registers.nvim"
  use "junegunn/vim-easy-align"
  use "Yggdroot/indentLine"
end)
