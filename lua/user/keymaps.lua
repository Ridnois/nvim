local keymap = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end

--local tmapper

vim.g.mapleader = ' '

-- write with w
keymap("n", "w", ":w<CR>")
-- quit with q
keymap("n", "q", ":q<CR>")
-- space + qq to force quit
keymap("n", "<Leader>qq", ":q!<CR>")
-- tt to copy line and paste under
keymap("n", "tt", ":t.<CR>")
-- space + vs to open vertical split
keymap("n", "<Leader>vs", ":vsp<CR>")
-- space + vt to open terminal on vertical split
keymap("n", "<Leader>vt", ":vsp | terminal<CR>")
-- space + sp to open terminal on split
keymap("n", "<Leader>sp", ":sp | terminal<CR>")
-- scape to exit edit mode on terminal
keymap("t", "<Esc>", "<C-\\><C-n>")
-- space + sr to source %
keymap("n", "<Leader>sr", ":source %<CR>")
keymap("n", "<Leader>bd", ":Bdelete!<CR>")
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>")
keymap("n", "<A-k>", "<Esc>:m .-2<CR>")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-- TELESCOPE
-- Find files using Telescope command-line sugar.
keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
-- Live grep on filesystem
keymap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
-- More about this later
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
-- Help tags
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")

-- TELESCOPE FILE EXPLORER
-- Open file explorer
keymap("n", "<Leader>fd", "<cmd>Telescope file_browser<CR>")

-- LSP
-- Go to definition
keymap("n", "<Silent>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- Go to declaration
keymap("n", "<Silent>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap("n", "<Silent>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
keymap("n", "<Silent>K", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.formatting()<CR>")
