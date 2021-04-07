local utils = require('utils')

-- Smart Case & Smartsign
vim.g.EasyMotion_smartcase = 1

-- Keys to use
vim.g.EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfjç'

-- Use just <space>
utils.map('', '<leader>', '<plug>(easymotion-prefix)', { noremap = false })

-- Keymappings
utils.map('', 'ç', '<plug>(easymotion-s2)', { noremap = false })
utils.map('', '<leader>l', '<plug>(easymotion-bd-jk)', { noremap = false })
utils.map('', '<leader><leader>', '<plug>(easymotion-bd-w)', { noremap = false })
