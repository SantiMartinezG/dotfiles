return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
	opts = {
		lsp = {
			-- Use noice's renderer for LSP markdown (hover docs, signature help)
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false, -- centered popup search (top of screen)
			command_palette = true, -- cmdline as floating palette (craftzdog style)
			long_message_to_split = true, -- long messages open in a split
			lsp_doc_border = true, -- rounded border on hover/signature (matches lspconfig)
			inc_rename = false,
		},
		routes = {
			-- Skip noisy "written" messages on save
			{
				filter = { event = "msg_show", kind = "", find = "written" },
				opts = { skip = true },
			},
			-- Skip "yanked X lines" messages
			{
				filter = { event = "msg_show", kind = "", find = "yanked" },
				opts = { skip = true },
			},
			-- Send long LSP messages and search counts to split instead of popup
			{
				filter = { event = "msg_show", min_height = 10 },
				view = "split",
			},
		},
	},
}
