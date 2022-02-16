local mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

local tmapper

vim.g.mapleader = ' '

-- write with w
mapper("n", "w", ":w<CR>")
-- quit with q
mapper("n", "q", ":q<CR>")
-- space + qq to force quit
mapper("n", "<Leader>qq", ":q!<CR>")
-- tt to copy line and paste under
mapper("n", "tt", ":t.<CR>")
-- space + vs to open vertical split
mapper("n", "<Leader>vs", ":vsp<CR>")
-- space + vt to open terminal on vertical split
mapper("n", "<Leader>vt", ":vsp | terminal<CR>")
-- space + sp to open terminal on split
mapper("n", "<Leader>sp", ":sp | terminal<CR>")
-- scape to exit edit mode on terminal
mapper("t", "<Esc>", "<C-\\><C-n>")
-- space + sr to source %
mapper("n", "<Leader>sr", ":source %<CR>")

-- TELESCOPE

-- Find files using Telescope command-line sugar.
mapper("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
-- Live grep on filesystem
mapper("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
-- More about this later
mapper("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
-- Help tags
mapper("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")

-- TELESCOPE FILE EXPLORER
-- Open file explorer
mapper("n", "<Leader>fd", "<cmd>Telescope file_browser<CR>")

-- LSP
-- Go to definition
mapper("n", "<Silent>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- Go to declaration
mapper("n", "<Silent>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
mapper("n", "<Silent>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
mapper("n", "<Silent>K", "<cmd>lua vim.lsp.buf.hover()<CR>")

