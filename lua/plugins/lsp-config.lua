return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {"emmylua_ls", "gopls"}
        },
        dependencies = {
            { 
                "mason-org/mason.nvim", opts = {} ,
                "neovim/nvim-lspconfig",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function() 
            vim.lsp.config['emmylua_ls'] = {
                cmd = {'emmylua_ls'},
                file_types = {'lua'}
            }
            vim.lsp.enable('emmylua_ls')
        end
    }
}
