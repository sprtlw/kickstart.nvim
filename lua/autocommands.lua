-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank { timeout = 200 } end,
})

-- Restore cursor position on file open
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Restore cursor position on file open',
  group = vim.api.nvim_create_augroup('kickstart-restore-cursor', { clear = true }),
  pattern = '*',
  callback = function()
    local line = vim.fn.line '\'"'
    if line > 1 and line <= vim.fn.line '$' then
      vim.cmd 'normal! g\'"'
    end
  end,
})

-- auto-create missing dirs when saving a file
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Auto-create missing dirs when saving a file',
  group = vim.api.nvim_create_augroup('kickstart-auto-create-dir', { clear = true }),
  pattern = '*',
  callback = function()
    local dir = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- Disable auto-continuation of comments on Enter
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('kickstart-disable-comment-continuation', { clear = true }),
  pattern = '*',
  callback = function() vim.opt_local.formatoptions:remove { 'c', 'r', 'o' } end,
})

-- Bold CursorLine for all themes
vim.api.nvim_create_autocmd('ColorScheme', {
  group = vim.api.nvim_create_augroup('kickstart-colorscheme', { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true })
    -- Remove grey background from statusline for cleaner appearance
    local statusline_groups = {
      'MiniStatuslineDevinfo',
      'MiniStatuslineFileinfo',
      'MiniStatuslineFilename',
      'MiniStatuslineInactive',
      'MiniStatuslineModeCommand',
      'MiniStatuslineModeInsert',
      'MiniStatuslineModeNormal',
      'MiniStatuslineModeOther',
      'MiniStatuslineModeReplace',
      'MiniStatuslineModeVisual',
    }
    for _, group in ipairs(statusline_groups) do
      vim.api.nvim_set_hl(0, group, { bg = 'none' })
    end
  end,
})
