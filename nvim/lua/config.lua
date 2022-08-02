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
  "                         “Be Better Than That”                       ",
  "                                                                     ",
  "                                                                     ",
}

-- File Type
require("filetype")

-- Git Signs
require('gitsigns').setup()
