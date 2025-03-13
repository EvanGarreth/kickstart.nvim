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
badd +120 ~/.config/jj-nvim/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks.indent.lua
badd +7 ~/.config/jj-nvim/lua/custom/plugins/roslyn.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/init.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks/init.lua
badd +42 ~/.config/jj-nvim/lua/custom/plugins/snacks/indent.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/snacks/animate.lua
badd +7 ~/.config/jj-nvim/lua/custom/plugins/snacks/explorer.lua
badd +8 ~/.config/jj-nvim/lua/custom/plugins/autopairs.lua
badd +962 ~/.local/share/jj-nvim/lazy/mini.nvim/lua/mini/ai.lua
badd +3 ~/.config/jj-nvim/lua/custom/plugins/snacks/picker.lua
badd +4 ~/.config/jj-nvim/lua/custom/plugins/actions-preview.lua
badd +1 ~/.config/jj-nvim/lua/custom/plugins/copilot.lua
badd +3 ~/.config/jj-nvim/lua/custom/plugins/copilot-chat.lua
argglobal
%argdel
edit ~/.config/jj-nvim/lua/custom/plugins/actions-preview.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/.config/jj-nvim/lua/custom/plugins/copilot-chat.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 4 - ((3 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
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
