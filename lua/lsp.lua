require("mason").setup();
require("mason-lspconfig").setup({
  ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"gopls",
		"golangci_lint_ls",
		"clangd",
		"neocmake",
		"zls",
		"ts_ls",
		"terraformls",
    "eslint",
    "html",
    "cssls",
		"astro",
    "tailwindcss",
		"html",
		"templ",
	},
	automatic_installation = true,
});

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, {})
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, {})
vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, {})
vim.keymap.set("n", "gr", vim.lsp.buf.hover, {})


vim.diagnostic.config({ virtual_lines = { only_current_line = true } })

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}

require("lspconfig").astro.setup({
	filetypes = { "astro" },
})

require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
	capabilities = capabilities,
	fileTypes= { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
})

require('lspconfig').ts_ls.setup({
	fileTypes= { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
})

require("lspconfig").clangd.setup {
	vim.api.nvim_create_autocmd('BufWritePre', {
		pattern = {"*.c", "*.h", "*.cpp", "*.hpp"},
		callback = function()
			vim.lsp.buf.format({ async = false })
		end,
	})
}

require("lspconfig").neocmake.setup {}

require("lspconfig").terraformls.setup{
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = {"*.tf", "*.tfvars"},
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,
	fileTypes= { "terraform" }
}



require("lspconfig").zls.setup {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_augroup('AutoFormatting', {})
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '*.zig',
			group = 'AutoFormatting',
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,
}

require('lspconfig').gopls.setup {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_augroup('AutoFormatting', {})
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '*.go',
			group = 'AutoFormatting',
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,
	filetypes = { "go" }
}

local capabilitiesHTML = vim.lsp.protocol.make_client_capabilities()
capabilitiesHTML.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
	on_attach = function(client, bufnr)
		vim.api.nvim_create_augroup('AutoFormatting', {})
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '*.html',
			group = 'AutoFormatting',
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,
	capabilities = capabilitiesHTML,
	filetypes = { "html", "templ" }
}
require'lspconfig'.templ.setup{
	on_attach = function(client, bufnr)
		vim.api.nvim_create_augroup('AutoFormatting', {})
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '*.templ',
			group = 'AutoFormatting',
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,
	filetypes = { "templ" }
}

require'lspconfig'.tailwindcss.setup{
	filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "templ" }
}

