local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- lsp
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use {
    'SmiteshP/nvim-gps',
    config = function () require("nvim-gps").setup{} end
  }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'

  -- completion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/nvim-cmp'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  use 'ray-x/cmp-treesitter'
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- languages
  -- use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use { 'ellisonleao/glow.nvim', ft = {'markdown'} }

  -- editor & coding
  use {
    'windwp/nvim-autopairs',
    config = function() require'nvim-autopairs'.setup {} end
  }
  use {
    'ggandor/leap.nvim',
    config = function() require('leap').set_default_keymaps() end
  }
  use 'tpope/vim-surround'
  use 'vim-test/vim-test'
  use 'editorconfig/editorconfig-vim'
  -- use 'tpope/vim-commentary'
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use 'tpope/vim-sleuth'
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup {} end
  }
  use {
    'crivotz/nvim-colorizer.lua',
    config = function() require'colorizer'.setup {} end
  }

  -- explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'nvim-tree'.setup {
        ignore_ft_on_setup = { '.git', 'node_modules', '.cache', '.DS_Store', '.keep' }
      }
    end
  }
  use 'nvim-telescope/telescope-project.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-frecency.nvim', requires = { 'tami5/sqlite.lua' } }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require'telescope'.load_extension('frecency')
      require'telescope'.load_extension('fzf')
      require'telescope'.load_extension('project')
    end
  }

  -- ui
  use {
    'folke/which-key.nvim',
    config = function() require'which-key'.setup {} end
  }
  use {
    'famiu/feline.nvim',
    -- config = function() require'feline'.setup {} end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require'indent_blankline'.setup {
        char = '┊', -- default is '|'
        filetype_exclude = { 'help', 'packer' },
        buftype_exclude = { 'terminal', 'nofile' },
        show_trailing_blankline_indent = false,
      }
   end
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require'gitsigns'.setup {
        signs = {
          add = { hl = 'GitGutterAdd', text = '+' },
          change = { hl = 'GitGutterChange', text = '~' },
          delete = { hl = 'GitGutterDelete', text = '_' },
          topdelete = { hl = 'GitGutterDelete', text = '‾' },
          changedelete = { hl = 'GitGutterChange', text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true})

          -- Actions
          map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
          map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', gs.stage_buffer)
          map('n', '<leader>hu', gs.undo_stage_hunk)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hb', function() gs.blame_line{full=true} end)
          map('n', '<leader>tb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
          map('n', '<leader>hD', function() gs.diffthis('~') end)
          map('n', '<leader>td', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require'neogit'.setup {} end
  }

  -- utils
  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require'toggleterm'.setup {
        open_mapping = [[<c-\>]],
      }
    end
  }
  use 'numToStr/FTerm.nvim'

  -- colorscheme
  use 'marko-cerovac/material.nvim'
  use 'joshdick/onedark.vim'
  use 'arcticicestudio/nord-vim'
  use 'projekt0n/github-nvim-theme'

  -- misc
  -- use 'tpope/vim-sensible'
  use 'wakatime/vim-wakatime'
end)
