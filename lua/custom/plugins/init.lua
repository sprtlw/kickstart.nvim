-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'cordx56/rustowl',
    version = '*', -- Latest stable version
    build = 'cargo install rustowl',
    lazy = false, -- This plugin is already lazy
    opts = {},
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  { 'b0o/schemastore.nvim' },
}
