local bootstrap_packer = function()
  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(packer_path)) == 1 then
    vim.api.nvim_command("!" .. table.concat({ "git", "clone", packer_repo, packer_path }, " "))
    vim.api.nvim_command("packadd packer.nvim")

    return true
  end

  return false
end

local setup_autosync = function()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
    group = vim.api.nvim_create_augroup("PackerGroup", { clear = true }),
  })
end

local startup = function(plugins, firstrun)
  local packer = require("packer")

  packer.startup({
    plugins,
    config = {
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "rounded" })
        end,
        prompt_border = "rounded",
      },
    },
  })

  if firstrun then
    packer.sync()
  end
end

local plugins = function(use)
  use({ "wbthomason/packer.nvim" })

  use({
    "projekt0n/github-nvim-theme",
    branch = "0.0.x",
    config = function()
      require("github-theme").setup({})
      vim.cmd.colorscheme("github_light")
    end,
  })

  use()

  use({
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup({ modes = { ":", "/", "?" } })
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
    config = function()
      require("telescope").setup({})
      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, {
        desc = "[ ] Find existing buffers"
      })

      vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, {
        desc = "[?] Find recently opened files"
      })

      vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, {
        desc = "[/] Fuzzy search in current buffer"
      })

      vim.keymap.set("n", "<leader>sf",
        function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true }) end, {
          desc = "[S]earch [F]iles"
        })

      vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, {
        desc = "[S]earch [H]elp"
      })

      vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, {
        desc = "[S]earch current [W]ord"
      })

      vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, {
        desc = "[S]earch by [G]rep"
      })

      vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, {
        desc = "[S]earch [D]iagnostics"
      })
    end
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require("nvim-tree").setup()
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
        group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
        callback = function()
          vim.opt.foldmethod = "expr"
          vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        end,
      })

      local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "elixir",
          "erlang",
          "go",
          "hcl",
          "html",
          "java",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "make",
          "nix",
          "python",
          "regex",
          "rst",
          "ruby",
          "rust",
          "scala",
          "scss",
          "toml",
          "tsx",
          "typescript",
          "yaml",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  })

  use({
    "gpanders/editorconfig.nvim",
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  -- use({
  --   'windwp/nvim-autopairs',
  --   config = function()
  --     require('nvim-autopairs').setup()
  --   end
  -- })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function()
          vim.wo.signcolumn = "yes"
        end,
      })
    end,
  })

  -- use({
  --   "hrsh7th/nvim-cmp",
  --   requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
  --   config = function()
  --     local cmp = require("cmp")
  --     local luasnip = require("luasnip")
  --
  --     cmp.setup({
  --       sources = {
  --         { name = "nvim_lsp" },
  --         { name = "luasnip" },
  --       },
  --       snippet = {
  --         expand = function(args) luasnip.lsp_expand(args.body) end,
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete({}),
  --         ["<CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }),
  --         ["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --         ["<S-Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_prev_item()
  --           elseif luasnip.jumpable(-1) then
  --             luasnip.jump(-1)
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" }),
  --       }),
  --     })
  --   end
  -- })

  -- use({
  --   "folke/neodev.nvim",
  --   config = function()
  --     require("neodev").setup()
  --   end
  -- })

  -- use({
  --   "neovim/nvim-lspconfig",
  --   requires = {
  --     "j-hui/fidget.nvim",
  --     -- "jose-elias-alvarez/null-ls.nvim"
  --   },
  --   config = function()
  --     local enable_format_on_save = function(client, bufnr)
  --       if not client.supports_method("textDocument/formatting") then
  --         return
  --       end
  --
  --       local group = vim.api.nvim_create_augroup("LspFormatting", {})
  --       vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
  --       vim.api.nvim_create_autocmd("BufWritePre", {
  --         group = group,
  --         buffer = bufnr,
  --         callback = function()
  --           vim.lsp.buf.format({ bufnr = bufnr })
  --         end,
  --       })
  --     end
  --
  --     local function sequentially(callbacks)
  --       return function(...)
  --         for _, callback in ipairs(callbacks) do
  --           callback(...)
  --         end
  --       end
  --     end
  --
  --     vim.diagnostic.config({ severity_sort = true })
  --     vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  --     vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  --     vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
  --     vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
  --
  --     -- Diagnostic icons
  --     for hl, icon in pairs({
  --       DiagnosticSignError = " ",
  --       DiagnosticSignWarn = " ",
  --       DiagnosticSignHint = "硫",
  --       DiagnosticSignInfo = " ",
  --     }) do
  --       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  --     end
  --
  --     require("fidget").setup({})
  --
  --     local lspconfig = require("lspconfig")
  --     require("lspconfig.ui.windows").default_options.border = "rounded"
  --
  --     local capabilities = vim.lsp.protocol.make_client_capabilities()
  --     capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  --
  --     -- local null_ls = require("null-ls")
  --     -- null_ls.setup({
  --     --     sources = {
  --     --         null_ls.builtins.formatting.stylua,
  --     --     },
  --     --     on_attach = sequentially({
  --     --         enable_format_on_save,
  --     --     }),
  --     -- })
  --
  --     lspconfig.lua_ls.setup({
  --       settings = {
  --         Lua = {
  --           runtime = {
  --             version = "LuaJIT",
  --           },
  --           format = {
  --             enable = true,
  --           },
  --           diagnostics = {
  --             globals = { "vim" },
  --           },
  --           workspace = {
  --             library = vim.api.nvim_get_runtime_file("", true),
  --             checkThirdParty = false,
  --           },
  --         },
  --       },
  --       capabilties = capabilities,
  --       on_attach = sequentially({
  --         enable_format_on_save,
  --       })
  --     })
  --
  --     lspconfig.terraformls.setup({
  --       capabilties = capabilities,
  --       on_attach = sequentially({
  --         enable_format_on_save,
  --       }),
  --     })
  --
  --     lspconfig.ocamllsp.setup({
  --       capabilties = capabilities,
  --       on_attach = sequentially({
  --         enable_format_on_save,
  --       }),
  --     })
  --     lspconfig.dagger.setup({
  --       capabilties = capabilities,
  --     })
  --   end,
  -- })
end

local firstrun = bootstrap_packer()
setup_autosync()
startup(plugins, firstrun)
