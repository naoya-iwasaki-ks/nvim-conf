return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd [[
        if has('termguicolors')
        set termguicolors
        endif

        set background=dark

        let g:gruvbox_material_background = 'soft'
        let g:gruvbox_material_foreground = 'material'
        let g:gruvbox_material_better_performance=1

        colorscheme gruvbox-material
        ]]
    end
  },
  { "b0o/schemastore.nvim" }
}
