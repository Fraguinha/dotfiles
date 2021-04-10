local utils = require('utils')

-- Smart Case & Smartsign
vim.g.EasyMotion_smartcase = 1

-- Keys to use
vim.g.EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'

-- Use just <space>
utils.map('', '<leader>', '<plug>(easymotion-prefix)', { noremap = false })

-- Keymappings
utils.map('', '<leader>l', '<plug>(easymotion-bd-jk)', { noremap = false })
