-- Options
local options = {
    -- General
    mouse = 'c',
    clipboard = 'unnamedplus',
    swapfile = false,
    completeopt = 'menuone,noinsert,noselect',
    -- Neovim UI
    number = true,
    showmatch = true,
    foldmethod = 'marker',
    colorcolumn = '81',
    splitright = true,
    splitbelow = true,
    ignorecase = true,
    smartcase = true,
    linebreak = true,
    termguicolors = true,
    laststatus = 3,
    cursorline = true,
    signcolumn = 'yes',
    showmode = false,
    -- Tabs, Ident
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
    -- Memory, CPU
    hidden = true,
    history = 100,
    lazyredraw = true,
    synmaxcol = 240,
    updatetime = 250,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Disable builtin plugins
local disabled_built_ins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
    'tutor',
    'rplugin',
    'synmenu',
    'optwin',
    'compiler',
    'bugreport',
    'ftplugin'
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g['loaded_' .. plugin] = 1
end
