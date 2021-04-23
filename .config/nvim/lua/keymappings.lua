local utils = require('utils')

-- Map leader to space
vim.g.mapleader = ' '

-- Yank
utils.map('n', 'Y', 'y$')

-- Redo
utils.map('n', 'U', '<c-r>')

-- Clear highlights
utils.map('n', '<c-l>', '<cmd>nohl<cr>')
