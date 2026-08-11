return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      require('config.copilot')
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require('copilot_cmp').setup()
    end
  },
  -- {
  --   "ravitemer/mcphub.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   build = "npm install -g mcp-hub@latest",
  --   config = function()
  --     require('config.mcphub')
  --   end
  -- },
  {
    "olimorris/codecompanion.nvim",
    after = { "mcphub.nvim" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('config.codecompanion')
    end,
  },
  -- {
  --   "tzachar/cmp-tabnine",
  --   build = "./install.sh",
  --   dependencies = "hrsh7th/nvim-cmp",
  -- }
}
