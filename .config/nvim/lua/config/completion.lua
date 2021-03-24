local utils = require('utils')

-- Enable Autocomplete
vim.cmd [[autocmd BufEnter * lua require'completion'.on_attach()]]

-- Use tabs
utils.map('i', '<tab>', '<plug>(completion_smart_tab)', { noremap = false })
utils.map('i', '<s-tab>', '<plug>(completion_smart_s_tab)', { noremap = false })

-- Set completeopt to have a better completion experience
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- Avoid showing message extra message when using completion
vim.cmd [[set shortmess+=c]]
