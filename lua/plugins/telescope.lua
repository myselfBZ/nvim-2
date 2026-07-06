return {
	{
		"nvim-telescope/telescope.nvim",

		tag = "0.1.5",

		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		config = function()
			require("telescope").setup({})

			local preview_utils = require("telescope.previewers.utils")
			preview_utils.ts_highlighter = function(bufnr, ft)
				local lang = vim.treesitter.language.get_lang(ft) or ft
				if not lang or lang == "" then
					return false
				end

				return pcall(vim.treesitter.start, bufnr, lang)
			end

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
			vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)
			vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
						}),

					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
