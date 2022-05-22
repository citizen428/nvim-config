set guifont=Fira\ Code\ Regular\ Nerd\ Font\ Complete:h14
set mouse=a

if exists('g:fvim_loaded')
  " Title bar themed with colorscheme
  FVimCustomTitleBar v:true

  " Font tweaks
  FVimFontAntialias v:true
  FVimFontAutoSnap v:true
  FVimFontAutohint v:true
  FVimFontHintLevel 'full'
  FVimFontLigature v:true
  FVimFontSubpixel v:true

  " UI options
  " FVimUIPopupMenu v:true
endif
