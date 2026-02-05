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
    -- Remove grey background from filename and middle parts for cleaner appearance
    -- Keep backgrounds for mode indicators, branch, and file type for visual distinction
    local statusline_groups = {
      'MiniStatuslineFilename',
      'MiniStatuslineInactive',
    }
    for _, group in ipairs(statusline_groups) do
      vim.api.nvim_set_hl(0, group, { bg = 'none' })
    end

    -- Set up powerline arrow highlight groups for smooth transitions
    -- Arrow from mode section to filename section
    local mode_colors = {
      { mode = 'Normal', next = 'Filename' },
      { mode = 'Insert', next = 'Filename' },
      { mode = 'Visual', next = 'Filename' },
      { mode = 'Command', next = 'Filename' },
      { mode = 'Replace', next = 'Filename' },
      { mode = 'Other', next = 'Filename' },
    }

    for _, config in ipairs(mode_colors) do
      local mode_hl_name = 'MiniStatuslineMode' .. config.mode
      local next_hl_name = 'MiniStatusline' .. config.next
      local mode_hl = vim.api.nvim_get_hl(0, { name = mode_hl_name })
      local next_hl = vim.api.nvim_get_hl(0, { name = next_hl_name })
      
      -- Arrow highlight: foreground = mode background, background = next section background
      vim.api.nvim_set_hl(0, mode_hl_name .. 'Arrow', {
        fg = mode_hl.bg,
        bg = next_hl.bg or 'NONE',
      })
    end

    -- Arrow from filename to devinfo section (right side arrow)
    local devinfo_hl = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineDevinfo' })
    local filename_hl = vim.api.nvim_get_hl(0, { name = 'MiniStatuslineFilename' })
    vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfoArrow', {
      fg = devinfo_hl.bg,
      bg = filename_hl.bg or 'NONE',
    })
  end,
})
