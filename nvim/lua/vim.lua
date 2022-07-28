local o = vim.o
local g = vim.g
local api = vim.api

local function nnoremap(key, cmd)
  api.nvim_set_keymap('n', key, cmd, { noremap = true })
end
local function vnoremap(key, cmd)
  api.nvim_set_keymap('v', key, cmd, { noremap = true })
end

-- Set leader
g.mapleader = " "

-- COC settings
g.coc_global_extensions = {'coc-json', 'coc-explorer', 'coc-tsserver', 'coc-julia'}
g.coc_enable_locationlist = 0

-- Vim CMD
-- Make sure all types of *.graphql files get syntax highlighting.
-- This is necessary for coc-prettier to work
vim.cmd('autocmd BufNewFile,BufRead *.graphql set ft=graphql')
vim.cmd [[
  nmap gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> gh :call Show_documentation()<CR>
  xmap <Leader>,  v<Plug>(coc-codeaction-selected)
  nmap <Leader>,  v<Plug>(coc-codeaction-selected)
  nmap <Leader>r <Plug>(coc-rename)
  nmap <silent> <leader>e <Plug>(coc-diagnostic-next-error)
  nmap <silent> <leader>E <Plug>(coc-diagnostic-prev-error)
  nmap <silent> <leader>w <Plug>(coc-diagnostic-next)
  nmap <silent> <leader>W <Plug>(coc-diagnostic-prev)
  function! Show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Press Enter to use the first suggestion
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]]

-- Auto format on save
-- Refer https://github.com/sbdchd/neoformat#basic-usage
vim.cmd [[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]]

-- key mappings
nnoremap('<CR>', ':wa<CR>')
nnoremap('<C-j>', ':cnext<CR>')
nnoremap('<C-k>', ':cprev<CR>')
-- Open file tree explorer (N-erdTree)
nnoremap('<Leader>n', ':CocCommand explorer<CR>')
-- Open [g]it dashboard
nnoremap('<Leader>g', ':tab Git<CR>')
-- Open [G]it diffs
nnoremap('<Leader>G', ':DiffviewOpen<CR>')
-- For opening Git [d]iff of current file vertically
nnoremap('<Leader>d', ':vert Gdiff<CR>')
-- [s]earch current highlighted word
vnoremap('<Leader>s', ':lua require("spectre").open_visual() <CR>')
-- [s]earch and replace
nnoremap('<Leader>s', ':lua require("spectre").open() <CR>')
-- Open file search (follows VSCode Cmd+p)
nnoremap('<Leader>p', ':Telescope git_files<CR>')
-- Open command pallete (follows VSCode Cmd+shift+p)
nnoremap('<Leader>P', ':Telescope commands<CR>')
-- Open registers search
nnoremap('<Leader>"', ':Telescope registers<CR>')
-- Open [b]uffer search
nnoremap('<Leader>b', ':Telescope buffers<CR>')
-- Global [f]ind
nnoremap('<Leader>f', ':Telescope live_grep<cr>')
-- Open current file [h]istory
nnoremap('<Leader>h', ':DiffviewFileHistory<CR>')
-- Toggle hop.nvim
nnoremap('<Leader>t', ':HopWord<CR>')
-- Markdown Preview
nnoremap('<Leader>m', ':MarkdownPreview<CR>')
-- Close Markdown Preview
nnoremap('<Leader>M', ':MarkdownPreviewStop<CR>')
-- Remove Highlight
nnoremap('<Leader>l', ':noh<CR>')
-- Exit
nnoremap('<Leader>q', ':q<CR>')
-- Close buffer
nnoremap('<Leader>B', ':bd<CR>')

-- vim settings
o.clipboard = o.clipboard .. 'unnamedplus'
o.number = true
o.relativenumber = false
o.autowrite = true
o.smartcase = true
o.ignorecase = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.shell = 'fish'
o.expandtab = true
o.wrap = true
o.swapfile = false
o.cursorline = true
o.cursorcolumn = true
o.hlsearch = true
o.incsearch = true
o.ttimeoutlen = 10
o.mouse = 'a'
o.inccommand = 'nosplit' -- For viewing live substitution
o.hidden = true -- to ensure terminal remains alive

-- https://github.com/iamcco/markdown-preview.nvim
-- Markdown Preview
g.mkdp_browser = 'brave-browser'

vim.cmd [[
augroup dashboard_au
     autocmd! * <buffer>
     autocmd User dashboardReady let &l:stl = 'Dashboard'
     autocmd User dashboardReady nnoremap <buffer> <leader>q <cmd>exit<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>u <cmd>PackerUpdate<CR>
     autocmd User dashboardReady nnoremap <buffer> <leader>l <cmd>SessionLoad<CR>
augroup END
]]

-- tabline colors
vim.cmd [[
  hi TabLine guibg=#A89984
  hi TabLineFill guibg=#3C3836
]]

-- floating windows color
vim.cmd [[
  hi Visual guibg=yellow
]]

-- COC colors
-- vim.cmd [[
--   hi CocErrorVirtualText guibg=pink guifg=darkred
--   hi CocInfoLine guibg=#fab005
--   hi CocInfoVirtualText guibg=#fab005 guifg=darkred
-- ]]

vim.cmd [[
  hi CocErrorSign guifg=#d1666a
  hi CocInfoSign guibg=#353b45
  hi CocWarningSign guifg=#d1cd66
]]

-- File Type
-- Do not source the default filetype.vim
g.did_load_filetypes = 1
