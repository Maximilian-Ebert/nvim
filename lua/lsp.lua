require("mason").setup();
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "clangd", "neocmake", "zls", "terraformls" },
});

require("lsp_lines").setup()
vim.diagnostic.config({
  virtual_text = false,
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, {})
	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, {})
	vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, {})
	--vim.keymap.set("n", "gr", require("telescope.builtin").lsp_refrences, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").rust_analyzer.setup {
	on_attach = on_attach,
	capabilities = capabilities
}
require("lspconfig").tsserver.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
	capabilities = capabilities
})

require("lspconfig").clangd.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").neocmake.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require("lspconfig").terraformls.setup{
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = {"*.tf", "*.tfvars"},
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,


	capabilities = capabilities
}


require("lspconfig").zls.setup {
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)
		vim.api.nvim_create_augroup('AutoFormatting', {})
		vim.api.nvim_create_autocmd('BufWritePre', {
			pattern = '*.zig',
			group = 'AutoFormatting',
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
  end,

	capabilities = capabilities
}
