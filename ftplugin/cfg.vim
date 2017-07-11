"Use matze/vim-ini-fold plugin to enable folding in 'cfg' files

if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

call IniFoldActivate()

call IniFoldUndo()
