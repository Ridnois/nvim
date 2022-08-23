local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
-- Save with CTRL + s
keymap("n", "<C-s>", ":w<CR>", opts)

keymap("n", "<Leader>sr", ":source %<CR>", opts)
-- tt to copy line and paste under
keymap("n", "tt", ":t.<CR>", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Resize with arrows (MacOS friendly)
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Move between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- space + vt to open terminal on vertical split
keymap("n", "<Leader>vt", ":vsp | terminal<CR>", opts)
-- space + sp to open terminal on split
keymap("n", "<Leader>sp", ":sp | terminal<CR>:resize 12<CR>", opts)
-- Visual Block --

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "p", '"_dP"', opts)
-- TELESCOPE

-- Find files using Telescope command-line sugar.
keymap("n", "<Leader>ff", "<cmd>Telescope find_files hidden=true<CR>", opts)
-- Live grep on filesystem
keymap("n", "<Leader>fg", "<cmd>Telescope live_grep hidden=true<CR>", opts)
-- Look for commits
keymap("n", "<Leader>gc", "<cmd>Telescope git_commits hidden=true<CR>", opts)
-- More about this later
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- Help tags
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- TELESCOPE FILE EXPLORER
-- Open file explorer
keymap("n", "<Leader>fd", "<cmd>Telescope file_browser<CR>", opts)


-- LSP
-- Go to definition
keymap("n", "<Silent>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- Go to declaration
keymap("n", "<Silent>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<Silent>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<Silent>K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<Leader>fc", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

-- nvim-tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>r", ":NvimTreeRefresh<CR>", opts)
keymap("n", "<Laeder>n", ":NvimTreeFindFile<CR>", opts)

-- TERMINAL
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- GitSigns
keymap("n", "<Leader>bl", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<Leader>hh", ":Gitsigns prev_hunk<CR>", opts)
keymap("n", "<Leader>lh", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<Leader>rh", ":Gitsigns reset_hunk<CR>", opts)

