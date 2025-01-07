local dap = require("dap")
local ui = require("dapui")
local wk = require("which-key")

require("dapui").setup()
require("dap-go").setup()
require("dap-python").setup("python3")

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end

wk.add({
	{ "<leader>b", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
	{ "<leader>gb", dap.run_to_cursor, desc = "Run to cursor" },
	{
		"<leader>b?",
		function()
			ui.eval(nil, { enter = true })
		end,
		desc = "Debug continue",
	},
	{ "<F1>", dap.continue, desc = "Continue" },
	{ "<F2>", dap.step_into, desc = "Step into" },
	{ "<F3>", dap.step_over, desc = "Step over" },
	{ "<F4>", dap.step_out, desc = "Step out" },
	{ "<F5>", dap.step_back, desc = "Step back" },
	{ "<F11>", dap.restart, desc = "Restart" },
	group = "debugging",
	mode = "n",
})
