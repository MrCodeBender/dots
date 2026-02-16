-- ====== OPCIONES GENERALES ======

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Números de línea
opt.number = true
opt.relativenumber = true

-- Indentación
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Visual
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.showmode = false
opt.colorcolumn = "80"

-- Comportamiento
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menuone,noselect"

-- ====== KEYMAPS ======

local map = vim.keymap.set

-- Limpiar búsqueda con Esc
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Moverse entre splits
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Redimensionar splits
map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Mover líneas en modo visual
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Mantener cursor centrado al scrollear
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Pegar sin perder el registro
map("x", "<leader>p", '"_dP')

-- Guardar rápido
map("n", "<leader>w", "<cmd>w<CR>")

-- Cerrar buffer
map("n", "<leader>q", "<cmd>q<CR>")

-- Explorador de archivos (netrw)
map("n", "<leader>e", "<cmd>Ex<CR>")

-- Seleccionar todo
map("n", "<C-a>", "ggVG")

-- ====== NETRW ======

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-- ====== AUTOCOMMANDS ======

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Resaltar al copiar (yank)
autocmd("TextYankPost", {
    group = augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank({ timeout = 200 })
    end,
})

-- Quitar trailing whitespace al guardar
autocmd("BufWritePre", {
    group = augroup("trim-whitespace", { clear = true }),
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

-- Volver a la última posición al abrir un archivo
autocmd("BufReadPost", {
    group = augroup("restore-cursor", { clear = true }),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lines = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lines then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})
