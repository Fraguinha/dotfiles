local utils = require('utils')

-- Surround
vim.cmd [[runtime macros/sandwich/keymap/surround.vim]]

local opts = { noremap = false }
utils.map('n', 'ss', 'yss', opts)
utils.map('n', 's', 'ys', opts)
utils.map('n', 'S', 'yS', opts)

utils.map('x', 'is', '<plug>(textobj-sandwich-query-i)', opts)
utils.map('x', 'as', '<plug>(textobj-sandwich-query-a)', opts)
utils.map('o', 'is', '<plug>(textobj-sandwich-query-i)', opts)
utils.map('o', 'as', '<plug>(textobj-sandwich-query-a)', opts)

utils.map('x', 'iss', '<plug>(textobj-sandwich-auto-i)', opts)
utils.map('x', 'ass', '<plug>(textobj-sandwich-auto-a)', opts)
utils.map('o', 'iss', '<plug>(textobj-sandwich-auto-i)', opts)
utils.map('o', 'ass', '<plug>(textobj-sandwich-auto-a)', opts)
