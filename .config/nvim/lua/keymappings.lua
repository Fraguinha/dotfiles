local utils = require('utils')

-- Map leader to space
vim.g.mapleader = ' '

-- Yank
utils.map('n', 'Y', 'y$')

-- Redo
utils.map('n', 'U','<c-r>')

-- Easymotion
utils.map('', '<leader>', '<plug>(easymotion-prefix)', { noremap = false })

utils.map('', '<leader>f', '<plug>(easymotion-bd-f)', { noremap = false })
utils.map('', '<leader>t', '<plug>(easymotion-bd-t)', { noremap = false })
utils.map('', '<leader>l', '<plug>(easymotion-bd-jk)', { noremap = false })
utils.map('n', '<leader>s', '<plug>(easymotion-sn)', { noremap = false })


-- Surround
vim.cmd [[runtime macros/sandwich/keymap/surround.vim]]

utils.map('n', 'ss', 'yss', { noremap = false })
utils.map('n', 's', 'ys', { noremap = false })
utils.map('n', 'S', 'yS', { noremap = false })

utils.map('x', 'is', '<plug>(textobj-sandwich-query-i)', { noremap = false })
utils.map('x', 'as', '<plug>(textobj-sandwich-query-a)', { noremap = false })
utils.map('o', 'is', '<plug>(textobj-sandwich-query-i)', { noremap = false })
utils.map('o', 'as', '<plug>(textobj-sandwich-query-a)', { noremap = false })

utils.map('x', 'iss', '<plug>(textobj-sandwich-auto-i)', { noremap = false })
utils.map('x', 'ass', '<plug>(textobj-sandwich-auto-a)', { noremap = false })
utils.map('o', 'iss', '<plug>(textobj-sandwich-auto-i)', { noremap = false })
utils.map('o', 'ass', '<plug>(textobj-sandwich-auto-a)', { noremap = false })

-- Clear highlights
utils.map('n', '<c-l>', '<cmd>nohl<cr>')
