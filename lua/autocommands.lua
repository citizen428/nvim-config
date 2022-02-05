vim.cmd [[
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

  augroup fish
    autocmd!
    autocmd Filetype fish compiler fish
    autocmd Filetype fish setlocal foldmethod=expr
  augroup end
]]
