---
name: Paraphrase content
interaction: inline
description: Paraphrase the variable/function name or the comment.
opts:
  modes:
    - v
  alias: paraphrase_content
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

Paraphrase the variable/function name or the comment (based on the content given) in the sophisticated way.

