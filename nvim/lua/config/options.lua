-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- Enable inline completion
-- vim.lsp.inline_completion.enable()

-- Elixir related
vim.filetype.add({
  pattern = {
    ["tmp%..*%.erl"] = "elixir",
  },
})
