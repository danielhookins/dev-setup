require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "yamlls",
        "html",
        "volar",
        "jsonls",
        "marksman",
        "pyright",
        "gopls",
        "clangd",
        "cmake",
    },
})

-- Determine the OS
local function get_os()
    return vim.loop.os_uname().sysname
end

-- Keybindings
local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>gr', require("telescope.builtin").lsp_references, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, {noremap = true, silent = true})
end


-- Lua: LuaLS
require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"},
            },
        },
    },
})

-- Go: gopls
require("lspconfig").gopls.setup({
    on_attach = on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
        },
    },
})

-- Python: Pyright
local function get_pyright_cmd()
    local os = get_os()
    if os == "Windows_NT" then
        -- Use the USERPROFILE environment variable to get the user's home directory on Windows
        local home = vim.fn.expand("$USERPROFILE")
        return {home .. "\\AppData\\Roaming\\npm\\pyright-langserver", "--stdio"}
    else
        -- For Linux and macOS
        return {"pyright-langserver", "--stdio"}
    end
end

require("lspconfig").pyright.setup({
    on_attach = on_attach,
    cmd = get_pyright_cmd(),
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
            formatting = {
                provider = "black",
            },
        },
    },
})

