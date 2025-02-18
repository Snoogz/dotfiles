return {
  'ThePrimeagen/harpoon',
  lazy = false,
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  init = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    -- telescope config
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local files_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(files_paths, item.values)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = files_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'H[a]rpoon File' })
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<leader>H1', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon File 1' })
    vim.keymap.set('n', '<leader>H2', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon File 2' })
    vim.keymap.set('n', '<leader>H3', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon File 3' })
    vim.keymap.set('n', '<leader>H4', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon File 4' })
  end,
}
