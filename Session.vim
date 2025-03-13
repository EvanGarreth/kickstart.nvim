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
badd +534 ~/.config/jj-nvim/init.lua
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
badd +24 ~/.config/jj-nvim/lua/custom/plugins/copilot.lua
badd +3 ~/.config/jj-nvim/lua/custom/plugins/copilot-chat.lua
badd +6 ~/.config/jj-nvim/lua/custom/plugins/copilot-cmp.lua
badd +1 ~/.local/state/jj-nvim/lsp.log
argglobal
%argdel
edit ~/.config/jj-nvim/lua/custom/plugins/copilot-cmp.lua
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
exe 'vert 1resize ' . ((&columns * 107 + 107) / 215)
exe 'vert 2resize ' . ((&columns * 107 + 107) / 215)
argglobal
balt ~/.config/jj-nvim/lua/custom/plugins/copilot.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 6 - ((5 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 014|
wincmd w
argglobal
if bufexists(fnamemodify("~/.config/jj-nvim/init.lua", ":p")) | buffer ~/.config/jj-nvim/init.lua | else | edit ~/.config/jj-nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/.config/jj-nvim/init.lua
endif
balt ~/.config/jj-nvim/lua/custom/plugins/copilot-cmp.lua
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 555 - ((34 * winheight(0) + 29) / 59)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 555
normal! 013|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 107 + 107) / 215)
exe 'vert 2resize ' . ((&columns * 107 + 107) / 215)
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
