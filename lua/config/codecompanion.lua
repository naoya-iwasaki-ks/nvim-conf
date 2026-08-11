local codecompanion = require("codecompanion")

codecompanion.setup({
  display = {
    action_palette = {
      width = 95,
      height = 10,
      prompt = "[> ",
      provider = "mini_pick",
      opts = {
        show_default_actions = true,
        show_default_prompt_library = true,
      },
    },
    chat = {
      auto_scroll = true,
      window = {
        -- List the chat buffer in the buffer list?
        buflisted = true,
        -- Chat window follows when switching tabs
        sticky = false,
        -- float|vertical|horizontal|tab|buffer
        layout = "buffer",
        full_height = false, -- for vertical layout
        -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
        position = nil,
        -- NOTE: You can set these to 0 for auto width/height
        width = 0.4, ---@return number|fun(): number
        height = 0.25, ---@return number|fun(): number
        border = "single",
        relative = "editor",
        -- Ensure that long paragraphs of markdown are wrapped
        opts = {
          breakindent = true,
          linebreak = true,
          wrap = true,
        },
      },
    },
    diff = {
      enabled = true,

      threshold_for_chat = 6,

      word_highlights = {
        additions = true,
        deletions = true,
      },
    }
  },
  adapters = {
    acp = {
      codex = function()
        return require("codecompanion.adapters").extend("codex", {
          defaults = {
            auth_method = "chatgpt"
          }
        })
      end,
      claude_code = function()
        local token = vim.fn.system("sops exec-env ~/.secret/claude.yaml 'echo $CLAUDE_CODE_OAUTH_TOKEN'")
        token = vim.trim(token)

        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            CLAUDE_CODE_OAUTH_TOKEN = token,
          },
        })
      end,
    },
    http = {
      gemma4 = function()
        return require('codecompanion.adapters').extend('ollama', {
          name = 'gemma4', -- Give this adapter a different name to differentiate it from the default ollama adapter
          schema = {
            model = {
              default = 'gemma4:e2b',
            },
          }
        })
      end,
    }
  },
  opts = {
    log_level = 'DEBUG',
  },
  prompt_library = {
    markdown = {
      dirs = {
        vim.fn.getcwd() .. "/.prompts",
        "~/.config/nvim/lua/config/prompts",
      },
    },
  },
  extensions = {
  },
  interactions = {
    chat = {
      adapter = 'claude_code',
      keymaps = {
        close = {
          modes = { n = "<C-x>", i = "<C-x>" },
          opts = {},
        },
      },
      tools = {
      },
      opts = {
        completion_provider = "cmp",
        slash_commands = "default",
      },
    },
    inline = {
      adapter = 'gemma4',
    },
    cli = {
      adapter = 'claude_code',
    },
    cmd = {
      adapter = 'gemma4',
    },
    background = {
      adapter = 'gemma4',
      chat = {
        callbacks = {
          ["on_ready"] = {
            actions = {
              "interactions.background.builtin.chat_make_title",
            },
            enabled = true,
          },
        },
        opts = {
          enabled = true,
        },
      },
    },
    opts = {
      triggers = {
        acp_slash_commands = "\\",
        editor_context = "#",
        slash_commands = "/",
        tools = "@",
      },
    },
  }
})

local function fix_diff_lines(buf)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local new_lines = {}
  local changed = false
  local in_diff = false

  for _, line in ipairs(lines) do
    if line:match("^%`+diff") then
      in_diff = true
      table.insert(new_lines, line)
    elseif line:match("^%`+$") and in_diff then
      in_diff = false
      table.insert(new_lines, line)
    elseif in_diff then
      local minus, plus = line:match("^(%-[^+]*)(%+.+)$")
      if minus and plus then
        table.insert(new_lines, minus)
        table.insert(new_lines, plus)
        changed = true
      else
        table.insert(new_lines, line)
      end
    else
      table.insert(new_lines, line)
    end
  end

  if changed then
    vim.bo[buf].modifiable = true
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, new_lines)
    vim.bo[buf].modifiable = false
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionChatCreated",
  callback = function(ev)
    local timer = nil
    vim.api.nvim_create_autocmd("TextChanged", {
      buffer = ev.buf,
      callback = function()
        if timer then timer:stop(); timer = nil end
        timer = vim.defer_fn(function()
          fix_diff_lines(ev.buf)
        end, 300)
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionChatClosed",
  callback = function(ev)
    vim.notify("chat closed buf=" .. ev.buf, vim.log.levels.WARN)
  end,
})

vim.keymap.set('n', '<leader>ca', '<cmd>CodeCompanionActions<CR>')
vim.keymap.set('v', '<leader>ca', '<cmd>CodeCompanionActions<CR>')

vim.keymap.set('n', '<leader>cf', '<cmd>CodeCompanion /generate_function<CR>')
vim.keymap.set('v', '<leader>cf', '<cmd>CodeCompanion /generate_function<CR>')
vim.keymap.set('n', '<leader>ci', '<cmd>CodeCompanion /investigate_error<CR>')
vim.keymap.set('v', '<leader>ci', '<cmd>CodeCompanion /investigate_error<CR>')
vim.keymap.set('n', '<leader>cp', '<cmd>CodeCompanion /paraphrase_content<CR>')
vim.keymap.set('v', '<leader>cp', '<cmd>CodeCompanion /paraphrase_content<CR>')
vim.keymap.set('n', '<leader>cc', '<cmd>CodeCompanion /default_chat<CR>')
vim.keymap.set('v', '<leader>cc', '<cmd>CodeCompanion /default_chat<CR>')
vim.keymap.set('n', '<leader>ce', '<cmd>CodeCompanion /explain_code<CR>')
vim.keymap.set('v', '<leader>ce', '<cmd>CodeCompanion /explain_code<CR>')
vim.keymap.set('n', '<leader>cu', '<cmd>CodeCompanion /container_use<CR>')
vim.keymap.set('v', '<leader>cu', '<cmd>CodeCompanion /container_use<CR>')
vim.keymap.set('n', '<leader>cr', '<cmd>CodeCompanion /review_file<CR>')
