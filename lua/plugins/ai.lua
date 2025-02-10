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
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    opts = {
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ",
          provider = "mini_pick",
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
      adapters = {
        chat = "ollama",
        inline = "ollama",
        config = {
          default_model = "deepseek-r1",
        },
      },
      strategies = {
        chat = {
          adapter = "ollama",
          keymaps = {
            send = {
              modes = { n = "<CR>", i = "<C-!>" },
            },
            close = {
              modes = { n = "<C-x>", i = "<C-x>" },
            },
            -- Add further custom keymaps here
          },
        },
        inline = {
          adapter = "ollama",
        },
      },
    }
  }
  -- {
  --   "tzachar/cmp-tabnine",
  --   build = "./install.sh",
  --   dependencies = "hrsh7th/nvim-cmp",
  -- }
}
