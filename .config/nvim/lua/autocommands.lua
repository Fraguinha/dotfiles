-- Disable automatic comments
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]
vim.cmd [[autocmd FileType * set formatoptions-=cro]]

-- Remove trailing whitespace
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]
