---
name: Review changes
interaction: chat
description: Review the changes in the file
opts:
  adapter:
    name: codex
  modes:
    - v
  alias: review_file
  auto_submit: true
  stop_context_insertion: false
  user_prompt: false
  is_workflow: true
---

## system

The user is working in buffer ${context.bufnr} which is a ${context.filetype} file.
Load the file content before deal with the user prompt.

## user

/caveman full
#{buffer}
#{diff}

Review the changes in this file and suggests changes or propose the fixes.

- Is there no syntax error?
- Is there implementation inconsistency?
- Is there weird naming convension?
- Is there vague and unclear expressions in comment?
- Is there deprecated thing?
