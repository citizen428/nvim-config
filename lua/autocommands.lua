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
    autocmd Filetype * setlocal noexpandtab shiftwidth=4 tabstop=4
    autocmd Filetype python setlocal expandtab softtabstop=4
    autocmd Filetype ruby setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd Filetype yaml setlocal indentkeys-=<:>
    autocmd Filetype zsh setlocal expandtab shiftwidth=4 softtabstop=4
  augroup end

  augroup terminal
    autocmd!
    autocmd TermOpen * startinsert
  augroup end

  augroup rust
    autocmd!
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
  augroup end

  augroup fish
    autocmd!
    autocmd Filetype fish setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd Filetype fish compiler fish
    autocmd Filetype fish setlocal foldmethod=expr
  augroup end

  augroup go
    autocmd!
    autocmd Filetype go setlocal makeprg=go\ build tabstop=4
  augroup end

  augroup lua
    autocmd!
    autocmd Filetype lua setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd BufWritePre *.lua :lua vim.lsp.buf.format()
  augroup end
]]
