local utils = require('utils')

-- Enable Autocomplete
vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

-- Use tabs
utils.map('i', '<tab>', 'pumvisible() ? "<c-n>" : "<tab>"', { noremap = true, expr = true })
utils.map('i', '<s-tab>', 'pumvisible() ? "<c-p>" : "<s-tab>"', { noremap = true, expr = true })

-- Set completeopt to have a better completion experience
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- Avoid showing message extra message when using completion
vim.cmd [[set shortmess+=c]]
