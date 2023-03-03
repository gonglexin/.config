return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "elixir-ls",
        "lua-language-server",

        -- html & js & css
        "emmet-ls",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "elixir",
        "heex",
        "html",
        "javascript",
        "json",
        "lua",
        "ruby",
        "typescript",
      },
    },
  },
}