require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {'progress'}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').setup {
  extensions = {
    file_browser = {
        -- use the "ivy" theme if you want
    }
  }
}

require('leap').create_default_mappings()

require('incline').setup()


local current_day = os.date("%A")
local veil_builtin = require("veil.builtin")

require('veil').setup({
  sections = {
    veil_builtin.sections.animated(veil_builtin.headers.frames_days_of_week[current_day], {
      hl = { fg = "#5de4c7" },
    }),
    -- other sections
    -- ...
  }
})



require("neotest").setup({
  adapters = {
    require("neotest-python")({
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = false },
        args = {"--log-level", "DEBUG"},
        -- Runner to use. Will use pytest if available by default.
        runner = "pytest",
        python = "/Users/ukrishnan/miniconda3/bin/python",
    })
  }
})
