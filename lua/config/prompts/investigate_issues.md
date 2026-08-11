---
name: Investigate error
interaction: chat
description: Investigate the error and fix the problem.
opts:
  modes:
    - v
  alias: investigate_error
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

This code in the file causes the compilation error. Find the culpit and fix the issue.

