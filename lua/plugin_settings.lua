require("config.telescope").setup()
require("config.treesitter").setup()
require("config.lualine").setup()

vim.cmd [[
  set completeopt=menuone,noselect
  set shortmess+=c

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
  nnoremap <silent> <leader>d :Telescope diagnostics<CR>

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

  nnoremap <silent> <leader>D <cmd>lua vim.lsp.buf.type_definition()<CR>

  nnoremap <leader>xx <cmd>TroubleToggle<cr>
  nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
  nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
  nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
  nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
  nnoremap gR <cmd>TroubleToggle lsp_references<cr>
]]

require('colorizer').setup({
  '*'; -- Highlight all files, but customize some others.
  css = { hsl_fn = true; }; -- Enable parsing rgb(...) functions in css.
})
