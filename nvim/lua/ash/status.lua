local opt = vim.opt
local cmd = vim.cmd

opt.laststatus = 2
opt.showmode = false

cmd([[
function! ModeName()
  let l:mode_map = {
        \ 'n' : 'NOR',
        \ 'i' : 'INS',
        \ 'v' : 'VIS',
        \ 'V' : 'VLINE',
        \ "\<C-v>" : 'VBLOC',
        \ 'c' : 'COM',
        \ 'R' : 'REP',
        \ 't' : 'TERM'
        \ }
  return get(l:mode_map, mode(), mode())
endfunction]])
opt.statusline = [[%{ModeName()}%=%f %y %m %r %p%% %l:%c]]

function SetNvimHeight()
    local total_lines = vim.o.lines
    cmd(string.format("resize %d", total_lines))
end
SetNvimHeight()
