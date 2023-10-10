return {
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

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.coding.codeium" },

  -- { import = "lazyvim.plugins.extras.lang.elixir" },
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.yaml" },

  { import = "lazyvim.plugins.extras.formatting.conform" },
  { import = "lazyvim.plugins.extras.linting.nvim-lint" },

  { import = "lazyvim.plugins.extras.test.core" },

  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.dap.nlua" },

  { import = "lazyvim.plugins.extras.util.project" },
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
}
