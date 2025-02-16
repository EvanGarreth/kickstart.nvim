let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/jj-nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +657 ~/.config/jj-nvim/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks.indent.lua
badd +7 ~/.config/jj-nvim/lua/custom/plugins/roslyn.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks/init.lua
badd +18 ~/.config/jj-nvim/lua/custom/plugins/snacks/indent.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks/animate.lua
badd +7 ~/.config/jj-nvim/lua/custom/plugins/snacks/explorer.lua
badd +8 ~/.config/jj-nvim/lua/custom/plugins/autopairs.lua
badd +962 ~/.local/share/jj-nvim/lazy/mini.nvim/lua/mini/ai.lua
argglobal
%argdel
edit ~/.config/jj-nvim/init.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 128 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 127 + 128) / 256)
argglobal
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 100 - ((28 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 100
normal! 029|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/jj-nvim/init.lua", ":p")) | buffer ~/.config/jj-nvim/init.lua | else | edit ~/.config/jj-nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/jj-nvim/init.lua
endif
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 3 - ((2 * winheight(0) + 28) / 56)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
wincmd w
exe 'vert 1resize ' . ((&columns * 128 + 128) / 256)
exe 'vert 2resize ' . ((&columns * 127 + 128) / 256)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
