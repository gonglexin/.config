return {
  -- {
  --   "f-person/git-blame.nvim",
  -- },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- html & js & css
        "html-lsp",
        "css-lsp",
        "emmet-language-server",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "diff",
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          init_options = {
            userLanguages = {
              eelixir = "html-eex",
              eruby = "erb",
              heex = "phoenix-heex",
            },
          },
        },
        emmet_language_server = {
          filetypes = {
            -- custom
            "heex",

            -- default
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "pug",
            "typescriptreact",
            "vue",
          },
        },
      },
      -- setup = {
      --   elixirls = function(_, opts)
      --     require("lspconfig").elixirls.setup({
      --       cmd = { "/Users/gonglexin/projects/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
      --     })
      --     return true
      --   end,
      -- },
    },
  },
}
