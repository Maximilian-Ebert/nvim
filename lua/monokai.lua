require('monokai-pro').setup({
	filter = "classic",
	transparent_background = false,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
	override = function()
    return {
			["@constructor"] = { fg = "#66d9ef" },
			["@tag"] = { fg = "#a6e22e" },
			["@tag.builtin"] = { fg = "#ae81ff" },
			["@tag.attribute"] = { fg = "#fd971f" }
    }
  end
});


vim.cmd([[colorscheme monokai-pro]])
