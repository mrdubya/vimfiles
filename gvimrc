" Gui VIM startup option file - run after vimrc
"

" Font du jour
" Go Mono is ok
let font_name = "Go Mono"

" Source Code Pro metrics allows for linespacing so not needed on Win32
"let font_name = "Source Code Pro Medium"
"let font_linespace = 0

let font_size = 9

" Configure GUI font
if has("win32")
  let font_spec = substitute(font_name, " ", "_", "g").":h".font_size
elseif has("gui_gtk")
  let font_spec = font_name." ".font_size
endif
let &guifont = font_spec

if exists('font_linespace') && font_linespace != &linespace
  let &linespace = font_linespace
endif

" Tweak GUI experience
" Disable GUI furniture - VIM is a keyboard based editor!
set   guioptions=M

" Platform specific setup
if has("win32")
  " Directx rendering
  set rop=type:directx,geom:1,renmode:4,taamode:1
  " xterm style mouse
  set mousemodel=extend
  " Maximise window on start
  au GUIEnter * simalt ~x
endif

"
" EOF _gvimrc
