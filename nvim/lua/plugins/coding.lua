return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        provider = "openai_compatible",
        provider_options = {
          openai_compatible = {
            -- api_key = "DEEPSEEK_API_KEY",
            -- end_point = 'https://api.deepseek.com/v1/chat/completions',
            -- name = "deepseek",
            api_key = "MOONSHOT_API_KEY",
            end_point = "https://api.moonshot.cn/v1/chat/completions",
            name = "moonshot",
            model = "moonshot-v1-32k",
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
          },
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
      "Kaiser-Yang/blink-cmp-dictionary",
      "moyiz/blink-emoji.nvim",
    },
    opts = {
      appearance = {
        kind_icons = {
          -- LLM Provider icons
          claude = "󰋦",
          openai = "󱢆",
          codestral = "󱎥",
          gemini = "",
          Groq = "",
          Openrouter = "󱂇",
          Ollama = "󰳆",
          ["Llama.cpp"] = "󰳆",
          Deepseek = "",
        },
      },
      keymap = {
        ["<C-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        default = { "dictionary", "avante", "lsp", "path", "snippets", "buffer", "emoji", "minuet" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          dictionary = {
            module = "blink-cmp-dictionary",
            name = "Dict",
            -- Make sure this is at least 2.
            -- 3 is recommended
            min_keyword_length = 3,
            opts = {
              -- options for blink-cmp-dictionary
              -- -- Where is your dictionary files
              -- dictionary_files = nil,
              -- Where is your dictionary directories, all the .txt files in the directory will be loaded
              dictionary_directories = { vim.fn.expand("~/.config/nvim/dictionary") },
            },
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            -- score_offset = 100,
          },
          avante = {
            module = "blink-cmp-avante",
            name = "Avante",
            opts = {
              -- options for blink-cmp-avante
            },
          },
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15, -- Tune by preference
            opts = { insert = true }, -- Insert emoji (default) or complete its name
            should_show_items = function()
              return vim.tbl_contains(
                -- Enable emoji completion only for git commits and markdown.
                -- By default, enabled for all file-types.
                { "gitcommit", "markdown" },
                vim.o.filetype
              )
            end,
          },
        },
      },
      completion = {
        menu = {
          -- border (single, rounded, etc)
          border = "rounded",

          -- use mini.icons
          -- draw = {
          --   components = {
          --     kind_icon = {
          --       ellipsis = false,
          --       text = function(ctx)
          --         local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
          --         return kind_icon
          --       end,
          --       -- Optionally, you may also use the highlights from mini.icons
          --       highlight = function(ctx)
          --         local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
          --         return hl
          --       end,
          --     },
          --   },
          -- },
        },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" } },
    },
  },

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
        -- ruby_lsp = {
        --   mason = false,
        --   cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        -- },
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
    },
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      -- add any opts here
      -- provider = "deepseek",
      provider = "moonshot",
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
          -- api_key_name = "SILICONFLOW_API_KEY",
          -- endpoint = "https://api.siliconflow.cn",
          -- model = "Pro/deepseek-ai/DeepSeek-V3",
        },
        moonshot = {
          __inherited_from = "openai",
          api_key_name = "MOONSHOT_API_KEY",
          endpoint = "https://api.moonshot.cn/v1",
          model = "moonshot-v1-32k", -- moonshot-v1-32k, moonshot-v1-128k, kimi-latest-8k, kimi-latest-32k, kimi-latest-128k
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "echasnovski/mini.icons",
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
