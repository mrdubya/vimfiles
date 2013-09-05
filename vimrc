" Main VIM startup option file
"

" Turn off vi compatability so we get all the goodies.
set nocompatible

" Startup options
set   bs=indent
set   clipboard=unnamed
set   complete=.,w,b,t
if has("win32")
  set   directory=$TEMP
elseif has("unix")
  " Don't create swap files in current directory
  set directory-=.
endif
set   dictionary+=~/vimfiles/dictionary
set   display=lastline
set   equalalways
set   eadirection=ver
set   formatoptions+=n
set   fileformats=unix,dos,mac
" hidden prevents autowrite
set   hidden
set   isfname+=(,)
set   laststatus=2
set   path+=**
set   ruler
set noshiftround
set   splitbelow
set   visualbell
set nowritebackup

" Memory settings
set   maxmem=2000000
set   maxmemtot=2000000

" Searching
set   incsearch
set   ignorecase
set   smartcase
set nowrapscan

" Insert completion
set   infercase

" Spelling
set   spelllang=en_gb
set   spellfile=$HOME/vimfiles/spell/mrw.utf-8.add

" Tabbing
set   smarttab

" Initial settings
set   textwidth=80

" Standard printing options
set   printoptions=left:54pt,right:36pt,top:54pt,bottom:54pt
set   printexpr=PrintManager(v:fname_in,2,0)

" List mode characters
set listchars=eol:¶,tab:\|-,trail:.

if has("multi_byte")
  set encoding=utf-8
endif

if has("win32")
" Don't get these on Windows!
  set   suffixes-=.o
" Remove a lot of VC from file lists
  set   suffixes+=.dsw,.dsp,.pdb,.idb,.pch,.ilk
end
" Remove some python files
set   suffixes+=.pyc,.pyo

" Some mappings
map <C-Tab>	:bnext<CR>
map <C-S-Tab>	:bprev<CR>

" Prevent buffers menu being created in gvim even though not used!
let no_buffers_menu = 1

" C highlighting options
let c_syntax_for_h = 1
let c_C94 = 1
let c_C99_warn = 1
let c_cpp_warn = 1
let c_warn_8bitchars = 1
let c_warn_multichar = 1
let c_warn_digraph = 1
let c_warn_trigraph = 1
let c_no_octal = 1

let c_comment_strings = 1
let c_comment_numbers = 1
let c_comment_types = 1
let c_comment_date_time = 1
let c_warn_nested_comments = 1

let c_cformat = 1
let c_space_errors = 1
let c_char_is_integer = 1

" Cos we have large log comments
let c_minlines = 100

" PostScript highlighting options
let postscr_level = 3
let postscr_fonts = 1

" PDF highlighting options
let pdf_level = 3

" Jam highlighting options
let jam_comment_strings = 1

" Make highlighting options
let make_microsoft = 1

" Python highlighting options
let python_highlight_all = 1
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4

" Setup my color scheme 
set   background=dark 
"colorscheme my_colors
colorscheme darkblue

"
runtime macros/matchit.vim

" Set up pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Set up copyright updater for my stuff
try
  call copyright#UpdateFor("Mike Williams")
catch
  echomsg ".vimrc: copyright update plugin not installed."
endtry

" Slightly different Statusline including encoding status
set   statusline=%f\ %y%r%w[%{&ff}]%{StatusFileEncoding('%')}%m%=%l,%c%V\ %P

" Assembler highlighting to use
let asmsyntax="tasm"

if has("unix")
  " Unix shell is bash
  let is_bash = 1
endif

command! SpellLegend2 noautocmd topleft new |
     \ setlocal buftype=nofile tabstop=8 |
     \ file Spell\ Legend |
     \ call clearmatches() |
     \ silent put ='           SpellBad        word not recognized' |
     \ call matchadd('SpellBad', 'SpellBad') |
     \ silent put ='           SpellCap        word not capitalized' |
     \ call matchadd('SpellCap', 'SpellCap') |
     \ silent put ='           SpellRare       rare word' |
     \ call matchadd('SpellRare', 'SpellRare') |
     \ silent put ='           SpellLocal      wrong spelling for selected region' |
     \ call matchadd('SpellLocal', 'SpellLocal') |
     \ 1d | resize 4 |
     \ setlocal winfixheight |
     \ noautocmd wincmd p

function! SpellLegend()
    for [l:group, l:explanation] in [
    \   ['SpellBad', 'word not recognized'],
    \   ['SpellCap', 'word not capitalized'],
    \   ['SpellRare', 'rare word'],
    \   ['SpellLocal', 'wrong spelling for selected region']
    \]
	echo ''
	echon l:group . "\t"
	execute 'echohl' l:group
	echon 'xxx'
	echohl None
	echon "\t" . l:explanation
    endfor
endfunction
command! -bar SpellLegend call SpellLegend()

" EOF _vimrc
