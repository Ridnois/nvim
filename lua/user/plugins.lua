local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}

	print "installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua files
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")

if not status_ok then
	return
end

-- Make packer use floating window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }	
		end,
	},
}

-- Add your plugins here
return packer.startup(function(use)

	use "wbthomason/packer.nvim" -- Packer
	-- File explorer
  use "kyazdani42/nvim-web-devicons" --for file icons
  use "kyazdani42/nvim-tree.lua"
	
	-- LSP
	use "neovim/nvim-lspconfig"
	use "williamboman/nvim-lsp-installer"
	use "tamago324/nlsp-settings.nvim"
	use "jose-elias-alvarez/null-ls.nvim"
	
  -- Autocomplete
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip"
  use "nvim-lua/plenary.nvim"
  use "jiangmiao/auto-pairs"	
  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  
  -- ColorScheme
	use "navarasu/onedark.nvim"
  use "shaunsingh/nord.nvim"
	
  -- Git
	use "lewis6991/gitsigns.nvim"
  
  -- Bottom panel
  use 'nvim-lualine/lualine.nvim'
  -- Solidity
  use "tomlion/vim-solidity"

  -- Greeter
  use "goolord/alpha-nvim"

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Comment lines
  use 'terrortylor/nvim-comment'
  if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
