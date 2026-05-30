-- my functions
require('colorscheme')

vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- Leader
vim.g.mapleader = ' '

-- Vim options
vim.o.relativenumber = true
vim.o.number = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.colorcolumn = '100'
vim.o.scrolloff = 999
vim.o.list = true
vim.o.confirm = true
vim.o.mouse = 'a'

vim.o.splitright = true
vim.o.splitbelow = true

 -- case for search
vim.o.ignorecase = true
vim.o.smartcase = true

-- tabstop
vim.o.shiftwidth = 4
vim.o.softtabstop = -1 -- vim uses shiftwidth if negative

-- cindent
vim.o.cindent = true
vim.o.cinoptions = 'l1, N-s'

-- Keymaps
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>', { desc = 'Remove search result highlighting' })
vim.keymap.set('n', '<leader>l', '<cmd>lopen<CR>', {});
vim.keymap.set('i', '<C-s><C-d>', '// @TODO(jdk): ', {})
vim.keymap.set('i', '<C-s><C-t>', '// @TAG(jdk): ', {})
vim.keymap.set('i', '<C-s><C-n>', '// @NOTE(jdk): ', {})

vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/ibhagwan/fzf-lua',
    'https://github.com/nvim-treesitter/nvim-treesitter',
})

require('fzf-lua').setup({
	files = {
	    cmd = 'find . -type f ! -path "./.git/*" ! -iname "*.o"'
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
