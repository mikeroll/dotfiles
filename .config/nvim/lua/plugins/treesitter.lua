return { {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
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
      }
    })
  end
}

}
