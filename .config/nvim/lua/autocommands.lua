-- Disable automatic comments
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]
vim.cmd [[autocmd FileType * set formatoptions-=cro]]

-- Highlight on yank
vim.cmd [[autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = false}]]

-- Remove trailing whitespace
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]
