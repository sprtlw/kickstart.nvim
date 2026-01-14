return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.

      -- transparency
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_background = 'hard'
      -- etc
      vim.g.gruvbox_material_enable_italic = true

      vim.cmd.colorscheme 'gruvbox-material'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
