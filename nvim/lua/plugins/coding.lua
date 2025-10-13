return {
  -- { "augmentcode/augment.vim" },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   config = function()
  --     require("minuet").setup({
  --       provider = "openai_compatible",
  --       -- provider = "gemini",
  --       -- provider = "claude",
  --       provider_options = {
  --         openai_compatible = {
  --           -- api_key = "DEEPSEEK_API_KEY",
  --           -- end_point = "https://api.deepseek.com/v1/chat/completions",
  --           -- name = "deepseek",
  --           api_key = "MOONSHOT_API_KEY",
  --           end_point = "https://api.moonshot.cn/v1/chat/completions",
  --           name = "moonshot",
  --           model = "moonshot-v1-32k",
  --           -- api_key = "OPENROUTER_API_KEY",
  --           -- end_point = "https://openrouter.ai/api/v1/chat/completions",
  --           -- name = "claude",
  --           -- model = "anthropic/claude-3.7-sonnet", -- anthropic/claude-3.5-sonnet, anthropic/claude-3.7-sonnet, anthropic/claude-3.7-sonnet:thinking
  --           optional = {
  --             max_tokens = 256,
  --             top_p = 0.9,
  --           },
  --         },
  --         claude = {
  --           -- model = "claude-3-5-haiku-20241022",
  --           -- model = "claude-3-7-sonnet-20250219",
  --           model = "claude-sonnet-4-20250514",
  --         },
  --         gemini = {
  --           optional = {
  --             generationConfig = {
  --               maxOutputTokens = 256,
  --             },
  --             safetySettings = {
  --               {
  --                 -- HARM_CATEGORY_HATE_SPEECH,
  --                 -- HARM_CATEGORY_HARASSMENT
  --                 -- HARM_CATEGORY_SEXUALLY_EXPLICIT
  --                 category = "HARM_CATEGORY_DANGEROUS_CONTENT",
  --                 -- BLOCK_NONE
  --                 threshold = "BLOCK_ONLY_HIGH",
  --               },
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "saghen/blink.cmp",
    dependencies = {
      "Kaiser-Yang/blink-cmp-avante",
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
        -- ["<C-y>"] = {
        --   function(cmp)
        --     cmp.show({ providers = { "minuet" } })
        --   end,
        -- },
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
        -- default = { "lsp", "path", "snippets", "buffer", "emoji", "minuet", "dictionary" },
        default = { "lsp", "path", "snippets", "buffer", "emoji", "dictionary" },
        per_filetype = {
          sql = { "snippets", "dadbod", "buffer" },
          AvanteInput = { "avante", "snippets", "buffer", "path" },
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
          -- minuet = {
          --   name = "minuet",
          --   module = "minuet.blink",
          --   -- score_offset = 100,
          -- },
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
        "expert",

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

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup()
    end,
  },
  -- {
  --   "yetone/avante.nvim",
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   -- ⚠️ must add this setting! ! !
  --   build = function()
  --     -- conditionally use the correct build system for the current OS
  --     if vim.fn.has("win32") == 1 then
  --       return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
  --     else
  --       return "make"
  --     end
  --   end,
  --   event = "VeryLazy",
  --   version = false, -- Never set this value to "*"! Never!
  --   ---@module 'avante'
  --   ---@type avante.Config
  --   opts = {
  --     -- add any opts here
  --     provider = "moonshot",
  --     -- provider = "deepseek",
  --     -- provider = "claude",
  --     -- provider = "open_router_claude",
  --     providers = {
  --       gemini = {
  --         api_key_name = "GEMINI_API_KEY",
  --       },
  --       open_router_claude = {
  --         __inherited_from = "openai",
  --         api_key_name = "OPENROUTER_API_KEY",
  --         endpoint = "https://openrouter.ai/api/v1",
  --         model = "anthropic/claude-3.7-sonnet",
  --       },
  --       claude = {
  --         api_key_name = "ANTHROPIC_AUTH_TOKEN",
  --         endpoint = "https://anyrouter.top",
  --         model = "claude-sonnet-4-20250514",
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 0.75,
  --           max_tokens = 20480,
  --         },
  --       },
  --       deepseek = {
  --         __inherited_from = "openai",
  --         api_key_name = "DEEPSEEK_API_KEY",
  --         endpoint = "https://api.deepseek.com",
  --         model = "deepseek-coder",
  --         -- api_key_name = "SILICONFLOW_API_KEY",
  --         -- endpoint = "https://api.siliconflow.cn",
  --         -- model = "Pro/deepseek-ai/DeepSeek-V3",
  --       },
  --       moonshot = {
  --         endpoint = "https://api.moonshot.cn/v1",
  --         model = "kimi-k2-0711-preview", -- moonshot-v1-32k, moonshot-v1-128k, kimi-latest-8k, kimi-latest-32k, kimi-latest-128k
  --         timeout = 30000, -- Timeout in milliseconds
  --         extra_request_body = {
  --           temperature = 0.75,
  --           max_tokens = 32768,
  --         },
  --       },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "nvim-mini/mini.pick", -- for file_selector provider mini.pick
  --     -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
  --     -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
  --     -- "stevearc/dressing.nvim", -- for input provider dressing
  --     "folke/snacks.nvim", -- for input provider snacks
  --     "nvim-mini/mini.icons",
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  --   -- system_prompt as function ensures LLM always has latest MCP server state
  --   -- This is evaluated for every message, even in existing chats
  --   system_prompt = function()
  --     local hub = require("mcphub").get_hub_instance()
  --     return hub and hub:get_active_servers_prompt() or ""
  --   end,
  --   -- Using function prevents requiring mcphub before it's loaded
  --   custom_tools = function()
  --     return {
  --       require("mcphub.extensions.avante").mcp_tool(),
  --     }
  --   end,
  --   disabled_tools = {
  --     "list_files", -- Built-in file operations
  --     "search_files",
  --     "read_file",
  --     "create_file",
  --     "rename_file",
  --     "delete_file",
  --     "create_dir",
  --     "rename_dir",
  --     "delete_dir",
  --     "bash", -- Built-in terminal access
  --   },
  -- },
}
