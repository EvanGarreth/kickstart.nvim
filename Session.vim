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
badd +162 ~/.config/jj-nvim/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks.indent.lua
badd +7 ~/.config/jj-nvim/lua/custom/plugins/roslyn.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks/animate.lua
badd +7 ~/.config/jj-nvim/lua/custom/plugins/snacks/explorer.lua
badd +962 ~/.local/share/jj-nvim/lazy/mini.nvim/lua/mini/ai.lua
badd +8 ~/.config/jj-nvim/lua/custom/plugins/snacks/picker.lua
badd +2 ~/.config/jj-nvim/lua/custom/plugins/neotest.lua
badd +18 ~/.config/jj-nvim/lua/custom/plugins/colorizer.lua
badd +3 ~/.config/jj-nvim/lua/kickstart/plugins/autopairs.lua
badd +1 ~/.config/jj-nvim/lua/kickstart/plugins/lint.lua
badd +19 ~/.config/jj-nvim/lua/kickstart/plugins/debug.lua
argglobal
%argdel
edit ~/.config/jj-nvim/init.lua
argglobal
setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal nofoldenable
let s:l = 162 - ((18 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 162
normal! 074|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
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
