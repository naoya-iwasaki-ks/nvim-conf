---
name: Default session
interaction: chat
description: Default session for code companion
opts:
  modes:
    - v
  alias: default_chat
  auto_submit: true
  stop_context_insertion: true
  user_prompt: true
  is_workflow: true
---

## system

The user is working in buffer ${context.bufnr} which is a ${context.filetype} file.
Load the file content before deal with the user prompt.

## user

/caveman full
#{buffer}


