require('plugins')
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

-- Tree sitter settings
require('nvim-treesitter.configs').setup({
    autotag = {
      enable = true
    },
    ensure_installed = "all",
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {} -- list of language that will be disabled
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
    }
})

-- Autopair settings
require('nvim-autopairs').setup({})

-- COC settings
g.coc_global_extensions = {'coc-json', 'coc-explorer', 'coc-tsserver', 'coc-julia'}
-- Open file tree explorer (N-erdTree)
nnoremap('<Leader>n', ':CocCommand explorer<CR>')
g.coc_enable_locationlist = 0
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

-- lualine settings
require('lualine').setup({
  sections = {
    lualine_a = {{'filename', path = 1}},
    lualine_b = {'g:coc_status'},
    lualine_c = {{'diagnostics', sources = {'coc'}}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'branch'}
  },
})

-- telescope settings
require('telescope').setup({
  defaults = {
    previewer = true,
    vimgrep_arguments = {
      "rg",
      "--with-filename",
      "--line-number",
      "--smart-case",
    },
    file_ignore_patterns = {
      "node_modules", "build"
    }
  }
})

-- neogit settings
require('neogit').setup({
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
  }
})

-- https://github.com/alvarosevilla95/luatab.nvim
require('luatab').setup({})

-- https://github.com/phaazon/hop.nvim
require('hop').setup({ keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5 })

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
o.ignorecase = false
o.tabstop = 4
o.shiftwidth = 2
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

-- colorscheme
-- g.vscode_style = "dark"
-- vim.cmd [[colorscheme vscode]]

local onedark = require('onedark')
onedark.setup {
    -- Main options --
    style = 'darker',
    transparent = true,
    code_style = {
        comments = 'italic',
        -- keywords = 'bold, italic',
        -- functions = 'none',
        strings = 'italic',
        variables = 'bold'
    },
}
onedark.load()


-- nvim-colorizer
require('colorizer').setup()


-- dashboard nvim
local dashboard = require("dashboard")
dashboard.session_directory = '~/.config/nvim/.sessions'
dashboard.custom_center = {
    {icon = '  ', desc = 'Find Git File             leader p  ', action = "Telescope git_files"},
    {icon = '  ', desc = 'Find Word                 leader s  ', action = "Telescope live_grep"},
    {icon = '  ', desc = 'Buffer                    leader b  ', action = "Telescope buffers"},
    {icon = '  ', desc = 'Close Buffer        leader shift b  ', action = "Telescope marks"},
    {icon = '  ', desc = 'New Directory              shift a  ', action = "DashboardNewFile"},
    {icon = '  ', desc = 'Update Plugins            leader u  ', action = "PackerUpdate"},
    {icon = '☮  ', desc = 'MD Preview                leader m  ', action = "MarkdownPreview"},
    {icon = '  ', desc = 'Exit                      leader q  ', action = "exit"}
}

dashboard.default_banner = nil

dashboard.custom_footer = {'',''}
dashboard.custom_footer = {'','N E O V I M'}

dashboard.custom_header = {
  "             ./oydN:                            :Ndyo/-`             ",
  "        `:+ydNMMMMMMs                            oMMMMMMNdy+:`       ",
  "    ./sdNMMMMMMMMMMMNs.                        .oNMMMMMMMMMMMNds/.   ",
  " `ohhdNMMMMMMMMMMMMMMMNo.        `  `        .omMMMMMMMMMMMMMMMNmhho.",
  " .-.``.-/oydmMMMMMMMMMMMNs/-    .h  h.    -/sNMMMMMMMMMMMmdyo/-.```-.",
  "           `.:mMMMMMMMMMMMMNd+- hM++Md -+dNMMMMMMMMMMMMN:.`          ",
  "              -NMMMMMMMMMMMMMMNdMMMMMMdNMMMMMMMMMMMMMMN:             ",
  "               .::://++ooymMMMMMMMMMMMMMMMMmhoo++//:::-              ",
  "                          ./hNMMMMMMMMMMNh/.                         ",
  "                             .+dNNNNNNd+-                            ",
  "                                -::::-                               ",
  "                                                                     ",
  "                                                                     ",
  "       “Slow is smooth and smooth is fast” - Chupapi Munyanyo        ",
  "                                                                     ",
  "                                                                     ",
}

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
  hi NormalFloat guibg=#fbf1c7
  hi Visual guibg=yellow
]]

-- COC colors
-- hi CocErrorLine guibg=pink
-- hi CocErrorVirtualText guibg=pink guifg=darkred
-- hi CocInfoLine guibg=#fab005
-- hi CocInfoVirtualText guibg=#fab005 guifg=darkred
vim.cmd [[
  hi CocErrorSign guifg=#d1666a
  hi CocInfoSign guibg=#353b45
  hi CocWarningSign guifg=#d1cd66
]]
