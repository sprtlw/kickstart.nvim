return {
  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline with powerline arrow styling
      local statusline = require 'mini.statusline'
      
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- Powerline separator characters (require Nerd Font)
      local sep_right = '' -- right arrow
      local sep_left = ''  -- left arrow

      -- Store the original section functions
      local section_mode = statusline.section_mode
      local section_git = statusline.section_git
      local section_diagnostics = statusline.section_diagnostics
      local section_filename = statusline.section_filename
      local section_fileinfo = statusline.section_fileinfo

      -- Override content function to add arrow separators
      ---@diagnostic disable-next-line: duplicate-set-field
      function statusline.active()
        local mode_hl, mode_str = section_mode { trunc_width = 120 }
        local git_str = section_git { trunc_width = 75 }
        local diagnostics_str = section_diagnostics { trunc_width = 75 }
        local filename_str = section_filename { trunc_width = 140 }
        local fileinfo_str = section_fileinfo { trunc_width = 120 }
        local location_str = statusline.section_location {}

        -- Build statusline with arrows
        -- Left side: mode with arrow pointing right to filename
        local result = string.format('%%#%s# %s %%#%sArrow#%s%%#MiniStatuslineFilename# %s', 
          mode_hl, mode_str, mode_hl, sep_right, filename_str)

        -- Middle: alignment
        result = result .. '%='
        
        -- Right side: build sections with arrows pointing left before each section
        -- Each section should have its own arrow for proper color transitions
        if git_str ~= '' then
          result = result .. string.format('%%#StatuslineGitArrow#%s%%#MiniStatuslineDevinfo# %s ', 
            sep_left, git_str)
        end
        
        if diagnostics_str ~= '' then
          result = result .. string.format('%%#StatuslineDiagArrow#%s%%#MiniStatuslineDevinfo# %s ', 
            sep_left, diagnostics_str)
        end
        
        result = result .. string.format('%%#StatuslineFileArrow#%s%%#MiniStatuslineDevinfo# %s ', 
          sep_left, fileinfo_str)
        result = result .. string.format('%%#StatuslineLocArrow#%s%%#MiniStatuslineDevinfo# %s ', 
          sep_left, location_str)

        return result
      end

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return '%2l:%-2v' end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
