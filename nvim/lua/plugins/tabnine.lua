return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "cmp_tabnine" } }))
    end,
  },
}
