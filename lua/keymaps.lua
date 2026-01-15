-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Close current buffer
vim.keymap.set('n', '<leader>Q', ':bd<CR>', { desc = 'Close current buffer' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Insert mode
vim.keymap.set('i', '<C-h>', '<left>', { desc = 'Move left in insert' })
vim.keymap.set('i', '<C-j>', '<down>', { desc = 'Move down in insert' })
vim.keymap.set('i', '<C-k>', '<up>', { desc = 'Move up in insert' })
vim.keymap.set('i', '<C-l>', '<right>', { desc = 'Move right in insert' })
-- Map escape sequence from Windows Terminal to <C-;>
vim.cmd 'set <C-;>=\\e[59;5u'
vim.keymap.set('i', '<C-;>', '<Esc>A;<Esc>a', { desc = 'Add semicolon at end of line' })

-- Nerd Commenter
vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<Plug>NERDCommenterComment', { desc = 'Comment' })
vim.keymap.set({ 'n', 'v' }, '<leader>cn', '<Plug>NERDCommenterNested', { desc = 'Comment (Nested)' })
vim.keymap.set({ 'n', 'v' }, '<leader>ct', '<Plug>NERDCommenterToggle', { desc = 'Toggle Comment' })
vim.keymap.set({ 'n', 'v' }, '<leader>cm', '<Plug>NERDCommenterMinimal', { desc = 'Comment (Minimal)' })
vim.keymap.set({ 'n', 'v' }, '<leader>ci', '<Plug>NERDCommenterInvert', { desc = 'Invert Comment' })
vim.keymap.set({ 'n', 'v' }, '<leader>cs', '<Plug>NERDCommenterSexy', { desc = 'Sexy Comment' })
vim.keymap.set({ 'n', 'v' }, '<leader>cy', '<Plug>NERDCommenterYank', { desc = 'Yank & Comment' })
vim.keymap.set({ 'n', 'v' }, '<leader>c$', '<Plug>NERDCommenterToEOL', { desc = 'Comment to EOL' })
vim.keymap.set({ 'n', 'v' }, '<leader>cA', '<Plug>NERDCommenterAppend', { desc = 'Append Comment' })
vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<Plug>NERDCommenterAltDelims', { desc = 'Alt Delimiters' })
vim.keymap.set({ 'n', 'v' }, '<leader>cu', '<Plug>NERDCommenterUncomment', { desc = 'Uncomment' })
vim.keymap.set({ 'n', 'v' }, '<leader>cl', '<Plug>NERDCommenterAlignLeft', { desc = 'Align Left' })
vim.keymap.set({ 'n', 'v' }, '<leader>cb', '<Plug>NERDCommenterAlignBoth', { desc = 'Align Both' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-M-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-M-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-M-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-M-k>', '<C-w>K', { desc = 'Move window to the upper' })
-- vim: ts=2 sts=2 sw=2 et
