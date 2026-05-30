-- my functions
require('colorscheme')

-- jdk: options/shell setup
if (vim.fn.has("win32") == 1) then
    vim.cmd.source("~/AppData/Local/nvim/vim/options.vim")
    vim.cmd.source("~/AppData/Local/nvim/vim/pwsh.vim")
else
    vim.cmd.source("~/.config/nvim/vim/options.vim")
end

-- Keymaps
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search result highlighting' })
vim.keymap.set('n', '<leader>l', '<cmd>lopen<CR>', {});
vim.keymap.set('i', '<C-s><C-d>', '// @TODO(jdk): ', {})
vim.keymap.set('i', '<C-s><C-t>', '// @TAG(jdk): ', {})
vim.keymap.set('i', '<C-s><C-n>', '// @NOTE(jdk): ', {})

vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

require('fzf-lua').setup({
	files = {
	    cmd = 'fd -E ".git" -E ".o" .'
	}
})

vim.keymap.set('n', '<leader>ff', FzfLua.files, { desc = 'fzf find files' })
vim.keymap.set('n', '<leader>fg', FzfLua.live_grep, { desc = 'fzf live grep' })
vim.keymap.set('n', '<leader>fo', FzfLua.oldfiles, { desc = 'fzf oldfiles' })
vim.keymap.set('n', '<leader>fr', FzfLua.resume, { desc = 'fzf oldfiles' })
vim.keymap.set('n', '<leader>ft', FzfLua.tags, { desc = 'fzf oldfiles' })
vim.keymap.set('n', '<leader><leader>', FzfLua.buffers, { desc = 'Telescope buffers' })


require('nvim-treesitter').setup()
local treesitter_langs = { 'lua', 'c', 'cpp', 'rust', 'glsl', 'javascript' }
require('nvim-treesitter').install(treesitter_langs)
vim.api.nvim_create_autocmd('FileType', {
    pattern = treesitter_langs,
    callback = function() vim.treesitter.start() end,
})

-- colorscheme
vim.cmd('highlight clear')
local cs_entry = colorscheme_entry
local set_hl = vim.api.nvim_set_hl
set_hl(0, 'Normal',     { fg = '#F8DE7E', bg = '#000000' })
set_hl(0, 'CursorLine', { bg = '#2D2D2D' })
apply_colorscheme_entries({
    cs_entry('#F8DE7E', { 'Delimiter', 'Identifier', 'Operator', '@variable', 'Function' }),
    cs_entry('#7C97F8', { 'Statement' }),
    cs_entry('#DD7CF8', { 'Type', 'Special' }),
    cs_entry('#6D6D6D', { 'Comment' }),
    cs_entry('#97F87C', { 'String', 'Constant' }),
})
