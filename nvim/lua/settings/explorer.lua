local actions = require('telescope.actions')
local opts = {
  defaults = {
    mappings = {
      i = {
	["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
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
require('telescope').setup(opts)

local M = {}

M.project_files = function()
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return M
