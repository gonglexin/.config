-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- use 'tpope/vim-sensible'
  -- use 'wakatime/vim-wakatime'
  use 'mhinz/vim-startify'

  use 'ggandor/lightspeed.nvim'
  use 'tpope/vim-surround'
  use 'editorconfig/editorconfig-vim'
  use { 'windwp/nvim-autopairs', config = function() require'nvim-autopairs'.setup {} end }
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Auto ident style
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- UI to select things (files, grep results, open buffers...)
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
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  use { 'folke/which-key.nvim', config = function() require'which-key'.setup {} end }

  use 'marko-cerovac/material.nvim'
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'NLKNguyen/papercolor-theme'
  use 'arcticicestudio/nord-vim'
  use 'projekt0n/github-nvim-theme'

  -- use 'nvim-lua/lsp-status.nvim' -- TODO: config it with feline
  use { 'famiu/feline.nvim', config = function() require'feline'.setup {} end }

  -- use {
  --   'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons',
  --   config = function() require'bufferline'.setup {} end
  -- }

  -- Add indentation guides even on blank lines
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

  -- Add git related info in the signs columns and popups
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
    'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim',
    config = function() require'neogit'.setup {} end
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
  use {"ellisonleao/glow.nvim"}

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use 'onsails/lspkind-nvim'
  use 'kosayoda/nvim-lightbulb'
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'ray-x/cmp-treesitter'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'rafamadriz/friendly-snippets' -- Snippets

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require'toggleterm'.setup {
        open_mapping = [[<c-\>]],
      }
    end
  }
  use "numtostr/FTerm.nvim"

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end
  }

  use { 'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup {} end }
end)

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

--Set highlight on search
-- vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

-- GUI font
vim.o.guifont = 'FiraCode Nerd Font:h18'

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line  (note: this is now a default on master)
map('n', 'Y', 'y$', { noremap = true })

map('n', '<leader>e', [[<cmd> :e $MYVIMRC<CR>]], opts)
map('n', '<leader>sv', [[<cmd> :source $MYVIMRC<CR>]], opts)
map('n', '<leader>`', [[<cmd> :terminal<CR>]], opts)

-- Neogit
map('n', '<leader>gg', [[<cmd>lua require('neogit').open()<CR>]], opts)

-- NvimTree
-- vim.g.nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] -- empty by default
map('n', '<leader>n', [[<cmd> :NvimTreeToggle<CR>]], opts)

-- Telescope
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
	["<esc>"] = actions.close,
      },
    },
  },
  -- pickers = {
  --   find_files = {
  --     theme = "dropdown",
  --   }
  -- },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

--Add leader shortcuts
map('n', '<leader>bb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
map('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
map('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opts)
map('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opts)
map('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], opts)
map('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opts)
map('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opts)
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opts)
map('n', '<leader><leader>', "<cmd>lua require'telescope'.extensions.frecency.frecency()<CR>", opts)
map('n', '<leader>pp', ":lua require'telescope'.extensions.project.project{}<CR>", opts)
map('n', '<leader>pf', "<cmd>lua require'telescope-config'.project_files()<CR>", opts)


-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- LSP settings
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- local opts = { noremap = true, silent = true }
  local buf_map = vim.api.nvim_buf_set_keymap
  buf_map(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_map(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_map(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_map(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_map(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_map(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_map(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>ca', '<cmd>:CodeActionMenu<CR>', opts)
  -- buf_map(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_map(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_map(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_map(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_map(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local options = {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    server:setup(options)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require'lspkind'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'treesitter' },
    { name = 'path' },
  },
  formatting = {
    format = function (entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      -- vim_item.menu = ({
      --   buffer = "[Buffer]",
      --   nvim_lsp = "[LSP]",
      --   luasnip = "[LuaSnip]",
      --   nvim_lua = "[Lua]",
      --   latex_symbols = "[Latex]",
      -- })[entry.source.name]
      return vim_item
    end,
  },
}

-- you need setup cmp first put this after cmp.setup()
require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

-- local function preview_location_callback(_, result)
--   if result == nil or vim.tbl_isempty(result) then
--     return nil
--   end
--   vim.lsp.util.preview_location(result[1])
-- end

-- function PeekDefinition()
--   local params = vim.lsp.util.make_position_params()
--   return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
-- end

-- material theme
vim.cmd[[colorscheme material]]
map('n', '<leader>mm', [[<cmd>lua require('material.functions').toggle_style()<CR>]], opts)
map('n', '<leader>me', [[<cmd>lua require('material.functions').toggle_eob()<CR>]], opts)
map('n', '<leader>ml', [[<cmd>lua require('material.functions').change_style('lighter')<CR>]], opts)
map('n', '<leader>md', [[<cmd>lua require('material.functions').change_style('darker')<CR>]], opts)
