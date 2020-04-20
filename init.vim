let mapleader=","

""" minpac
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Aesthetics
  call minpac#add('morhetz/gruvbox')
  call minpac#add('junegunn/rainbow_parentheses.vim')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')

  " Functionalities
  call minpac#add('alvan/vim-closetag')
  call minpac#add('chrisbra/Colorizer')
  call minpac#add('ervandew/supertab')
  call minpac#add('honza/vim-snippets')
  call minpac#add('jiangmiao/auto-pairs')
  call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('junegunn/vim-easy-align')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('scrooloose/nerdcommenter')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call minpac#add('SirVer/ultisnips')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-surround')
  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  call minpac#add('Yggdroot/indentLine')
  call minpac#add('w0rp/ale')
  call minpac#add('mhinz/vim-grepper')
  call minpac#add('janko-m/vim-test')
  " call minpac#add('metakirby5/codi.vim')

  " Programming languages
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
  call minpac#add('zchee/deoplete-go', { 'do': 'make'})
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

""" Settings

" Encoding
set encoding=utf-8

" Aesthetics
if (has("termguicolors"))
  set termguicolors
endif

if has("gui_vimr")
  let g:python3_host_prog = expand("$HOME/.asdf/shims/python")
  set background=light
  let g:gruvbox_contrast_light = 'hard'
else
  set background=dark
  let g:gruvbox_contrast_dark = 'soft'
endif

colorscheme gruvbox

highlight Pmenu guibg=white guifg=black gui=bold
highlight Comment gui=bold
highlight Normal gui=none
highlight NonText guibg=none

" Other Configurations
filetype plugin on
set fillchars+=vert:\ 
set foldenable foldmethod=indent foldlevel=1 foldcolumn=1
set ignorecase smartcase
set inccommand=split
set list listchars=trail:»,tab:»-
set number relativenumber
set scrolloff=2
set showmatch
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
set title
set wrap breakindent
set colorcolumn=80,100

""" Plugin Configurations

" NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
" Disable documentation window
" set completeopt-=preview

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_setColors = 0

" TagBar
let g:tagbar_width = 30
let g:tagbar_iconchars = ['↠', '↡']

" fzf-vim
nnoremap <C-p> :<C-u>FZF<CR>

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'Type'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Character'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" ALE
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <plug>(ale_previous)
nmap <silent> ]w <plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" vim-grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'grep', 'git']

nmap <leader>g :Grepper<CR>
nmap <Leader>G :Grepper -cword -noprompt<CR>

" vim-test
let test#strategy = "dispatch"

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

""" Terminal settings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

""" Custom Functions

"" Trim Whitespaces
function! TrimWhitespace()
  let l:save = winsaveview()
  %s/\\\@<!\s\+$//e
  call winrestview(l:save)
endfunction

function ToggleBackground()
  if (&background == 'light')
    set background=dark
    echo "background -> dark"
  else
    set background=light
    echo "background -> light"
  endif
endfunction

""" Custom Mappings

nmap <leader>q :NERDTreeToggle<CR>
nmap \ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap <leader>f :Files<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader><Tab> :bnext<CR>
nmap <leader><S-Tab> :bprevious<CR>
nmap <leader>b :call ToggleBackground()<CR>

nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

cabbrev Wq wq

