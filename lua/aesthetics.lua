vim.cmd [[
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  if (has("termguicolors"))
    set termguicolors
  endif

  colorscheme nofrils-acme

  function! ToggleBackground()
    if (g:colors_name == "nofrils-acme")
      colorscheme nofrils-dark
    else
      colorscheme nofrils-acme
    endif
  endfunction

  highlight link GitSignsCurrentLineBlame Comment
]]
