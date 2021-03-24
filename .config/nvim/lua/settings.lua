local utils = require('utils')

-- Commands
vim.cmd [[syntax enable]]
vim.cmd [[filetype plugin indent on]]

-- Buffers
utils.opt('o', 'hidden', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)

-- Indentation
local indent = 2
utils.opt('o', 'shiftround', true)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)

-- Numbers
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)

-- Search
utils.opt('o', 'hlsearch', false)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'ignorecase', true)

-- RegExp
utils.opt('o', 'wildmode', 'list:longest')

-- Scrolling
utils.opt('o', 'scrolloff', 8)

-- Share clipboard
utils.opt('o', 'clipboard','unnamed,unnamedplus')
