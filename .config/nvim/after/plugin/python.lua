local nvim_lsp = require('lspconfig')

if vim.fn.executable('pyright-langserver') == 1 then
    nvim_lsp.pyright.setup({
        cmd = { 'pyright-langserver', '--stdio' },
        root_dir = function(fname)
            return nvim_lsp.util.find_git_ancestor(fname) or nvim_lsp.util.path.dirname(fname)
        end,
        settings = { python = {} }
    })
end
