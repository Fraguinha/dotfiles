local utils = require('utils')

-- Use just <space>
utils.map('', '<leader>', '<plug>(easymotion-prefix)', { noremap = false })

-- Keymappings
utils.map('', '<leader>f', '<plug>(easymotion-bd-f)', { noremap = false })
utils.map('', '<leader>t', '<plug>(easymotion-bd-t)', { noremap = false })
utils.map('', '<leader>l', '<plug>(easymotion-bd-jk)', { noremap = false })
utils.map('n', '<leader>s', '<plug>(easymotion-sn)', { noremap = false })
