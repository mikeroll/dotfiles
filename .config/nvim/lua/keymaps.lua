-- sudo-saver
vim.keymap.set("c", "w!!", "w !sudo tee % >/dev/null", {})

-- <space> as leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
