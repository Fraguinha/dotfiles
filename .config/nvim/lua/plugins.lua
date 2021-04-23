-- Automatically install packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]

-- Auto compile when there are changes in plugins.lua
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

-- Plugins
return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Theme
  use 'gruvbox-community/gruvbox'
  use 'vim-airline/vim-airline'

  -- Extensions
  use 'michaeljsmith/vim-indent-object'
  use 'machakann/vim-sandwich'
  use 'jiangmiao/auto-pairs'
  use 'wellle/targets.vim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
end)
