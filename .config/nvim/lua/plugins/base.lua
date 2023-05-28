return {
    {
      'projekt0n/github-nvim-theme', branch = '0.0.x', lazy =false, priority = 1000, config = function()
      require('github-theme').setup({
        dark_float = true
      })
      vim.cmd.colorscheme("github_light")
    end
    },

    { "nvim-tree/nvim-web-devicons", lazy = true },

 {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup({
        -- sections = {
        --  lualine_b = { {'b:gitsigns_head', icon = ''}, },
        -- },
        options = {
          extensions = { "nvim-tree" },
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },   {
      "gelguy/wilder.nvim",
      config = function()
        require("wilder").setup({ modes = { ":", "/", "?" } })
      end,
    },

{
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup({
        stages = "fade",
        timeout = 1000,
      })
      vim.notify = require("notify")
    end,
  }
}
