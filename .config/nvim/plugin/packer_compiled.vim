" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/fraguinha/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/fraguinha/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/fraguinha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/fraguinha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/fraguinha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/vim-gitgutter"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/fraguinha/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
