local plugins =
{
    {
        "nvimtools/none-ls.nvim",
        event = "VeryLazy",
        opts = function ()
            return require "custom.configs.null-ls"
        end,
    },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
    {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed ={
        "clangd",
        "pyright",
        "mypy",
        "eslint-lsp",
        "typescript-language-server",
      }
    }
  },
    {
        "windwp/nvim-ts-autotag",
        ft ={
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        config = function ()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function ()
            opts = require "plugins.configs.treesitter"
            opts.ensure_installed={
                "lua",
                "javascript",
                "typescript",
                "tsx",
            }
        return opts
        end
    },
    {
        '0x00-ketsu/autosave.nvim',
        event = {"VeryLazy",  "InsertLeave", "TextChanged" },
        config = function()
                require('autosave').setup {
                prompt_style='stdout',
                prompt_message=function ()
                    return 'Autosave: saved at ' .. vim.fn.strftime('%H:%M:%S')
                end
    }
  end
    },
    {
        'notjedi/nvim-rooter.lua',
        config=function () require 'nvim-rooter'.setup({
            rooter_patterns = { '.git'},
            trigger_patterns = { '*' },
            manual = false,
            fallback_to_parent = false,
        }) end
    },

    --- theme plugins

    { "bluz71/vim-nightfly-colors", 
        name = "nightfly", 
        lazy = false, 
        priority = 1000 
    },
    
}
return plugins
