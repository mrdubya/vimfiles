" Gui VIM startup option file - run after _vimrc
"

" Gui settings
if has("win32")
  " Preferred font and rendering
  set   guifont=Source_Code_Pro:h9
  set   linespace=0
  set   rop=type:directx,geom:1,renmode:4,taamode:1
  " Maximise window
  au GUIEnter * simalt ~x
elseif has("unix")
  if has("gui_gtk")
    set   guifont=Source\ Code\ Pro\ Medium\ 10
  endif
endif
set   guioptions=M  " Ensures nothing is done about the GUI menu in menu.vim
set   mousemodel=extend
set   winaltkeys=no

"
" EOF _gvimrc
