return {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.5",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
  
        telescope.setup({
          defaults = {
            prompt_prefix = "🔍 ",
            selection_caret = "➜ ",
            layout_config = { prompt_position = "bottom" },
          },
          extensions = {
            fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
          },
        })
        telescope.load_extension("fzf")
      end
    },
  } 