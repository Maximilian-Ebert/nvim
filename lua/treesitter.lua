require'nvim-treesitter.configs'.setup {
  highlight = {
		enable = true,
		ensure_installed = {"typescript", "javascript", "html", "css", "c", "cpp", "cmake", "zig"}
	},
}
