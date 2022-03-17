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

	-- ColorScheme
	use 'navarasu/onedark.nvim'
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
