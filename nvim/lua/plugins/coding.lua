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

  {
    "Exafunction/codeium.vim",
    -- event = "BufEnter",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true })
    end,
  },
  -- {
  --   {
  --     "jcdickinson/http.nvim",
  --     build = "cargo build --workspace --release",
  --   },
  --   {
  --     "jcdickinson/codeium.nvim",
  --     dependencies = {
  --       "jcdickinson/http.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "hrsh7th/nvim-cmp",
  --     },
  --     config = function()
  --       require("codeium").setup({})
  --     end,
  --   },
  -- },

  { import = "lazyvim.plugins.extras.coding.yanky" },

  -- { import = "lazyvim.plugins.extras.lang.elixir" },
  { import = "lazyvim.plugins.extras.lang.ruby" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.yaml" },

  { import = "lazyvim.plugins.extras.test.core" },

  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.dap.nlua" },

  { import = "lazyvim.plugins.extras.util.project" },
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
}
