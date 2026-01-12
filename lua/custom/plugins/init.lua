-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('crates').setup {
        lsp = {
          enabled = true,
          on_attach = function(client, bufnr)
            -- the same on_attach function as for your other language servers
            -- can be ommited if you're using the `LspAttach` autocmd
          end,
          actions = true,
          completion = true,
          hover = true,
        },
      }
    end,
  },
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {}
  },
  { 'b0o/schemastore.nvim' },
  { 'preservim/nerdcommenter' },
}
