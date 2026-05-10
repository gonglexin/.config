return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-dictionary",
      "moyiz/blink-emoji.nvim",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
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
        ["<Tab>"] = {
          "snippet_forward",
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          function() -- if you are using Neovim's native inline completions
            return vim.lsp.inline_completion.get()
          end,
          "fallback",
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "emoji", "dictionary" },
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
        },
        documentation = { window = { border = "rounded" } },
      },
      signature = { window = { border = "rounded" } },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- elixir
        -- "expert",
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
}
