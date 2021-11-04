" vim:foldmethod=marker:foldlevel=0

" {{{ Lua config
lua << EOF
require('plugins')
require('statusline')
require('lsp')

require('nvim-tree').setup {}
require('telescope').load_extension('fzf')
EOF
" }}}

" Aesthetics {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if (has("termguicolors"))
  set termguicolors
endif

colorscheme nord

function! ToggleBackground()
  if (&background == 'light')
    colorscheme nord
    echo "background -> dark"
  else
    colorscheme paper
    echo "background -> light"
  endif
endfunction
" }}}

" Settings {{{
let mapleader = ","
let maplocalleader = " "

set autoread
set cmdheight=2
set clipboard=unnamedplus
set colorcolumn=80,100
set cpt-=t
set cursorline
set fillchars+=vert:\ 
set foldenable foldmethod=syntax foldlevelstart=99 foldcolumn=1
set ignorecase smartcase
set inccommand=split
set lazyredraw
set list listchars=trail:»,tab:»-
set mouse=a
set number relativenumber
set noshowmode
set noswapfile
set scrolloff=2
set showmatch
set signcolumn=yes
set splitbelow splitright
set title
set updatetime=300
set undofile
set wrap breakindent
set wildignorecase
set wildmode=longest,list,full
set wildmenu

let &undodir = $HOME . "/.local/share/nvim/undo"
let g:ruby_host_prog = '~/.asdf/shims/neovim-ruby-host'
let g:python3_host_prog = '~/.asdf/shims/python3'
" }}}

" Plugin settings {{{

" nvim-compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.buffer = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.path = v:true
let g:compe.source.spell = v:true
let g:compe.source.vsnip = v:true

set completeopt=menuone,noselect
set shortmess+=c

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" AutoSave
let g:auto_save = 1
let g:auto_save_silent = 1

" Colorizer
let g:colorizer_auto_filetype = 'scss,css,html'
let g:colorizer_skip_comments = 1

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_setColors = 1

" vim-test
let test#strategy = "dispatch"

nnoremap <silent> <leader>tn :TestNearest<CR>
nnoremap <silent> <leader>tf :TestFile<CR>
nnoremap <silent> <leader>ts :TestSuite<CR>
nnoremap <silent> <leader>tl :TestLast<CR>
nnoremap <silent> <leader>tg :TestVisit<CR>

" clever-f
let g:clever_f_fix_key_direction = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_mark_direct = 1
let g:clever_f_smart_case = 1

nmap f<Esc> <Plug>(clever-f-reset)

" kommentary
lua << EOF
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>cc", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<leader>c", "<Plug>kommentary_visual_default", {})
EOF
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
" }}}

" Autocmds {{{
autocmd BufWritePost plugins.lua PackerCompile

function! TrimWhitespace()
  if &ft == 'markdown'
    return
  endif
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

augroup trim_whitespace
  autocmd!
  autocmd BufWritePre * call TrimWhitespace()
augroup end

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require('vim.highlight').on_yank()
augroup end

augroup indentation
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
  autocmd Filetype make setlocal noexpandtab softtabstop=0
augroup end

augroup terminal
  autocmd!
  autocmd TermOpen * startinsert
augroup end

augroup rust
  autocmd!
  autocmd Filetype rust setlocal shiftwidth=4 tabstop=4
  autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup end
" }}}

" Mappings {{{

" Prevent accidental macro recording
nnoremap q <Nop>
nnoremap <leader>q q

nnoremap <silent> \ :NvimTreeToggle<CR>
nnoremap <silent> <leader>of :NvimTreeFindFile<CR>

nmap <silent> <C-p> :Telescope find_files<CR>
nnoremap <leader>g :Telescope live_grep theme=dropdown previewer=false<CR>
nnoremap <Leader>G :Telescope grep_string theme=dropdown previewer=false<CR>
nnoremap <silent> <leader>b :Telescope buffers show_all_buffers=true<CR>
nnoremap <silent> <leader>h :Telescope help_tags<CR>

nnoremap <silent> <leader>U :UndotreeToggle<CR>
nnoremap <silent> <leader>ff :call TrimWhitespace()<CR> <Bar> gg=G<C-O>
nnoremap <silent> <leader>v :edit $MYVIMRC<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nnoremap <silent> <leader><Tab> :bnext<CR>
nnoremap <silent> <leader><S-Tab> :bprevious<CR>
nnoremap <silent> <leader>tb :call ToggleBackground()<CR>
nnoremap <silent> <leader>bd :%bdelete<CR>
nnoremap <silent> <leader>f :let @+ = expand("%") <Bar> echo @+<CR>
nmap <leader>bs :ls<CR>:b<space>

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

nnoremap H ^

inoremap jk <Esc>

cabbrev Wq wq

" reselect pasted text
nnoremap gP `[v`]

" Operator pending mappings
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>

" LSP
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gs    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gp    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>
nmap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
" }}}
