return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Theme
  use { 'vim-airline/vim-airline' }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }

  -- Extensions
  use { 'michaeljsmith/vim-indent-object' }
  use { 'machakann/vim-sandwich' }
  use { 'easymotion/vim-easymotion' }
  use { 'wellle/targets.vim' }

end)

