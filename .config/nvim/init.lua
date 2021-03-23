-- Settings
require('settings')

-- Auto install packer.nvim
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
-- Auto compile when there are changes in plugins.lua
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Auto commands
require('autocommands')

-- LSP
require('lsp')

-- Configuration
require('config')
