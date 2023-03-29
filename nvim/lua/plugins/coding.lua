return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "elixir-ls",
        "lua-language-server",
        -- ruby
        "solargraph",

        -- html & js & css
        "html-lsp",
        "css-lsp",
        "emmet-ls",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir",
        "heex",
        "ruby",
      })
    end,
  },
}
