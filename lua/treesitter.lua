require'nvim-treesitter.configs'.setup {
  highlight = {
		enable = true,
		ensure_installed = {"typescript", "tsx", "jsx", "javascript", "html", "css", "c", "cpp", "cmake", "zig", "go", "html", "templ"}
	},
}

