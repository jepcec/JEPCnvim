call plug#begin('C:\Users\jhon\AppData\Local\nvim\plugins')

" Barra de estado
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Escritura
Plug 'jiangmiao/auto-pairs'

" Ventanas
Plug 'voldikss/vim-floaterm'

" Lenguajes y lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

"IDE
Plug 'yggdroot/indentline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'folke/tokyonight.nvim'

call plug#end()

" Configuración StatusBar
let g:airline_theme='base16_atlas'

" Configuración floaterm
let g:floaterm_keymap_new    = '<F9>'
let g:floaterm_keymap_hide   = '<F10>'
let g:floaterm_keymap_show   = '<F11>'
let g:floaterm_keymap_kill   = '<F12>'

if has('win64')
	let g:floaterm_shell = 'powershell.exe'
endif

lua vim.cmd[[colorscheme tokyonight]]

" Configuración de Mason y LSP y otros
lua << EOF
-- Requiere nvim-cmp y otros módulos
local cmp = require('cmp')
local lspconfig = require('lspconfig')
local luasnip = require('luasnip') -- Asegúrate de que LuaSnip esté cargado

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Usa LuaSnip para expansión de snippets
    end,
  },
    sources = {
    { name = 'nvim_lsp' }, -- Completar con LSP
    { name = 'buffer' },   -- Completar con el buffer actual
    { name = 'path' },     -- Completar con rutas de archivos
    { name = 'cmdline' },  -- Completar con comandos en la línea de comandos
  },
})

-- Configuración de Mason
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'pyright' } -- Asegurarse de que clangd esté instalado
})

-- Configuración de nvim-lspconfig
local lspconfig = require('lspconfig')

EOF

" Configuración de Neovim
set number
set relativenumber
highlight Normal guibg=NONE ctermbg=NONE

syntax enable


