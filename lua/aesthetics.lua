vim.cmd [[
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

  highlight link GitSignsCurrentLineBlame Comment
]]
