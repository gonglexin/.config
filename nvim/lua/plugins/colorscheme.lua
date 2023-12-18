return {
  { "yorickpeterse/nvim-grey" },

  -- Configure LazyVim to load theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "grey",
    },
  },

  -- Configure telescope use `grey` layout
  {
    "telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          -- These three settings are optional, but recommended.
          prompt_prefix = "",
          entry_prefix = " ",
          selection_caret = " ",

          -- This is the important part: without this, Telescope windows will look a
          -- bit odd due to how borders are highlighted.
          layout_strategy = "grey",
          layout_config = {
            -- The extension supports both "top" and "bottom" for the prompt.
            prompt_position = "top",

            -- You can adjust these settings to your liking.
            width = 0.6,
            height = 0.5,
            preview_width = 0.6,
          },
        },
      })
      require("telescope").load_extension("grey")
    end,
  },
}
