---
name: Explain code
interaction: chat
description: Explain the code selected
opts:
  modes:
    - v
  alias: explain_code
  auto_submit: true
  stop_context_insertion: true
  user_prompt: false
  is_workflow: true
---

## system

The user is working in buffer ${context.bufnr} which is a ${context.filetype} file.
Load the file content before deal with the user prompt.

## user

/caveman full
#{buffer}

Could you explain the code?

- Why is this needed.
- What this code does.
