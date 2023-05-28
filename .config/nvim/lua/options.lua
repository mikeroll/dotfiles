vim.g.syntax_on = true
vim.opt.title = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 250

vim.opt.completeopt = "menuone,noselect"

-- Keep swapfiles in ~/.cache
vim.opt.directory = os.getenv("HOME") .. "/.cache/nvim/swapfiles"

-- Disable unused plugin providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
