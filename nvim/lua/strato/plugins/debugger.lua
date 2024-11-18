return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				"nvim-neotest/nvim-nio",
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dap.set_log_level("INFO")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},
			{
				"leoluz/nvim-dap-go",
				config = function()
					require("dap-go").setup()
				end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					automatic_installation = true,
					handlers = {},
					ensure_installed = {
						"delve",
					},
				},
			},
		},
		config = function()
			local dap = require("dap")

			-- Configurar keymaps
			vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Start/Continue debugging" })
			vim.keymap.set("n", "<leader>dv", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set conditional breakpoint" })
			vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
			vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last debug configuration" })

			-- Keymap específico para depurar tests de Go
			vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test, { desc = "Debug Go test" })
		end,
	},
}
