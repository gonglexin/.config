return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- html & js & css
        "html-lsp",
        "css-lsp",
        "emmet-ls",
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
      -- setup = {
      --   elixirls = function(_, opts)
      --     require("lspconfig").elixirls.setup({
      --       cmd = { "/Users/gonglexin/projects/lexical/_build/dev/rel/lexical/start_lexical.sh" },
      --     })
      --     return true
      --   end,
      -- },
    },
  },

  { import = "lazyvim.plugins.extras.coding.yanky" },

  { import = "lazyvim.plugins.extras.lang.elixir" },
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },

  { import = "lazyvim.plugins.extras.test.core" },

  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.dap.nlua" },

  { import = "lazyvim.plugins.extras.util.project" },
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
}
