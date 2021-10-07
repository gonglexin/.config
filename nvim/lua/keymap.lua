local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Y yank until the end of line  (note: this is now a default on master)
map('n', 'Y', 'y$', { noremap = true })

-- map('n', '<leader>e', [[<cmd> :e $MYVIMRC<CR>]], opts)
-- map('n', '<leader>sv', [[<cmd> :source $MYVIMRC<CR>]], opts)

-- Neogit
map('n', '<leader>gg', [[<cmd>lua require('neogit').open()<CR>]], opts)

-- Telescope
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
map('n', '<leader>pf', "<cmd>lua require'settings.explorer'.project_files()<CR>", opts)

-- NvimTree
map('n', '<leader>pn', [[<cmd> :NvimTreeToggle<CR>]], opts)

-- material theme
map('n', '<leader>mm', [[<cmd>lua require('material.functions').toggle_style()<CR>]], opts)
map('n', '<leader>me', [[<cmd>lua require('material.functions').toggle_eob()<CR>]], opts)
map('n', '<leader>ml', [[<cmd>lua require('material.functions').change_style('lighter')<CR>]], opts)
map('n', '<leader>md', [[<cmd>lua require('material.functions').change_style('darker')<CR>]], opts)
