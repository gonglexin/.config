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
        "diff",
        "elixir",
        "heex",
        "ruby",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_ls = {
          filetypes = {
            -- custom
            "heex",

            -- default
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "eruby",
          },
        },
      },
    },
  },

  { import = "lazyvim.plugins.extras.lang.tailwind" },

  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.dap.nlua" },

  { import = "lazyvim.plugins.extras.util.project" },
}
