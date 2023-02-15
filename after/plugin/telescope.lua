local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><leader>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.9 }
    },
  },
})
