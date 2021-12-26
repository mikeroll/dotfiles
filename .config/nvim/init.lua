vim.opt.syntax = "enable"
vim.opt.title = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.cmd("filetype plugin indent on")

-- Keep swapfiles in ~/.cache
vim.opt.directory = os.getenv("HOME") .. "/.cache/nvim/swapfiles"

-- sudo-saver
vim.api.nvim_set_keymap("c", "w!!", "w !sudo tee % >/dev/null", {})

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require("lualine").setup({
        options = {
          theme = "github",
          section_separators = '',
          component_separators = '',
        },
      })
    end
  }

  use {
    'projekt0n/github-nvim-theme',
    requires = {"hoob3rt/lualine.nvim", opt = true},
    config = function()
      vim.opt.background = "light"
      require("github-theme").setup({
        theme_style = "light",
        colors = {
          bg_highlight = "#f6f8fa",
        },
        -- transparent = true
      })
    end
  }

  use 'hashivim/vim-terraform'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

