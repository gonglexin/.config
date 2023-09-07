-- return {
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "tzachar/cmp-tabnine",
--       build = "./install.sh",
--     },
--     opts = function(_, opts)
--       local cmp = require("cmp")
--       opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine" } }))
--     end,
--   },
-- }
return {
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    config = function()
      require("tabnine").setup({
        disable_auto_comment = true,
        accept_keymap = "<C-l>",
        dismiss_keymap = "<C-]>",
        debounce_ms = 800,
        suggestion_color = { gui = "#ffafff", cterm = 219 },
        exclude_filetypes = { "TelescopePrompt" },
        log_file_path = nil, -- absolute path to Tabnine log file
      })
    end,
  },
}
