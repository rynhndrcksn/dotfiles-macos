local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.hlsearch = false 
opt.incsearch = true -- incremental search (10/10)
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors for colorschemes to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- complete the longest common match, and allow tabbing the results to fully complete them
opt.wildmode = 'longest:full,full'

-- keep cursor 8 characters in from top/bottom (unless at top/bottom of file)
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.title = true -- adds title to tmux bar
opt.confirm = true -- ask for confirmation instead of erroring
opt.undofile = true -- persistent undo
opt.backup = true -- automatically save a backup file
opt.backupdir:remove('.') -- keep backups out of the current directory
opt.signcolumn = 'yes:1' -- keep a column for Gitsigns so the column doesn't move
