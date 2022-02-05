local options = {
  autoread = true,
  clipboard = "unnamedplus",
  cmdheight = 2,
  colorcolumn ="80,100",
  cursorline = true,
  foldenable = true,
  foldmethod = "syntax",
  foldlevelstart = 99,
  foldcolumn = "1",
  ignorecase = true,
  smartcase = true,
  inccommand = "split",
  lazyredraw = true,
  list = true,
  listchars = "trail:»,tab:»-",
  mouse = "a",
  number = true,
  relativenumber = true,
  showmode = false,
  swapfile = false,
  scrolloff = 2,
  showmatch = true,
  signcolumn = "yes",
  splitbelow = true,
  splitright = true,
  title = true,
  updatetime = 300,
  undofile = true,
  wrap = true,
  breakindent = true,
  wildignorecase = true,
  wildmode = "longest,list,full",
  wildmenu = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd [[
  let mapleader = ","
  let maplocalleader = " "

  set cpt-=t
  set fillchars+=vert:\

  let &undodir = $HOME . "/.local/share/nvim/undo"
  let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
  let g:python3_host_prog = '~/.asdf/shims/python3'
]]
