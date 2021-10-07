local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- lsp
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'trouble'.setup {} end
  }
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  -- use 'nvim-lua/lsp-status.nvim' -- TODO: config it with feline

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'ray-x/cmp-treesitter'
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
  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-surround'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup {} end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup {} end
  }

  -- explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
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
    config = function() require'feline'.setup {} end
  }
  -- use {
  --   'akinsho/bufferline.nvim',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function() require'bufferline'.setup {} end
  -- }
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
  use 'numtostr/FTerm.nvim'

  -- colorscheme
  use 'marko-cerovac/material.nvim'
  use 'joshdick/onedark.vim'
  use 'NLKNguyen/papercolor-theme'
  use 'arcticicestudio/nord-vim'
  use 'projekt0n/github-nvim-theme'

  -- misc
  -- use 'tpope/vim-sensible'
  use 'wakatime/vim-wakatime'
  use 'mhinz/vim-startify'
end)
