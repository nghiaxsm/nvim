-- Bootstrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Autocommand that reloads nevim whenever you save the packer_init.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer_init.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return require('packer').startup(function(use)

    -- Packer
    use {
        'wbthomason/packer.nvim'
    }

    -- Color schemes
    use {
        'navarasu/onedark.nvim'
    }
    -- Nvim web devicons
    use {
        'nvim-tree/nvim-web-devicons'
    }

    -- Lua Line
    use {
        'nvim-lualine/lualine.nvim'
    }

    -- Bar bar
    use {
        'romgrk/barbar.nvim'
    }

    -- Nvim Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({with_sync = true })
        end
    }

    -- Indent blankline
    use {
        'lukas-reineke/indent-blankline.nvim'
    }

    -- Autopairs
    use {
        'windwp/nvim-autopairs'
    }

    -- Tagbar
    use {
        'preservim/tagbar'
    }

    -- LSP config
    use {
        'neovim/nvim-lspconfig',
    }

    -- Git signs
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup{}
        end
    }

    -- Colorizer
    use {
        'norcalli/nvim-colorizer.lua'
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        require = {
            'M3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        }
    }

    -- Linter
    use {
      'mfussenegger/nvim-lint'
    }

end)
