local options = {
  autoread       = true,
  clipboard      = "unnamedplus",
  cmdheight      = 1,
  colorcolumn    = "100",
  cursorline     = true,
  foldenable     = true,
  foldmethod     = "syntax",
  foldlevelstart = 99,
  foldcolumn     = "1",
  ignorecase     = true,
  smartcase      = true,
  inccommand     = "split",
  laststatus     = 3,
  lazyredraw     = true,
  list           = true,
  listchars      = "trail:␣,tab:» ",
  mouse          = "a",
  number         = true,
  relativenumber = true,
  showmode       = false,
  swapfile       = false,
  scrolloff      = 2,
  showmatch      = true,
  signcolumn     = "yes",
  splitbelow     = true,
  splitright     = true,
  title          = true,
  updatetime     = 300,
  undofile       = true,
  wrap           = true,
  breakindent    = true,
  wildignorecase = true,
  wildmode       = "longest,list,full",
  wildmenu       = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.mapleader = ","
vim.g.maplocalleader = " "
vim.opt.cpt = vim.opt.cpt - { "t" }

vim.go.undodir = vim.env.HOME .. "/.local/share/nvim/undo"
vim.g.ruby_host_prog = "~/.asdf/shims/neovim-ruby-host"
vim.g.python3_host_prog = "~/.asdf/shims/python3"

vim.g.neoterm_default_mod = "botright"
