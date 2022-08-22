vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

if vim.fn.has("termguicolors") then
  vim.o.termguicolors = true
end

vim.cmd [[
  colorscheme nofrils-acme
  let g:nofrils_strbackgrounds=1
  call NofrilsNormal()

  function! ToggleBackground()
    if (g:colors_name == "nofrils-acme")
      colorscheme nord
    else
      colorscheme nofrils-acme
    endif
  endfunction

  highlight link GitSignsCurrentLineBlame Comment
  highlight Vertsplit guibg=bg guifg=bg
]]
