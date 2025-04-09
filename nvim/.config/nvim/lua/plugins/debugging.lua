return {
  'mfussenegger/nvim-dap',
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },

  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()

    vim.keymap.set("n", "<leader>du", function()
      dapui.toggle()
    end, { desc = "Toggle DAP UI" })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,

  vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end),
  vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end),
  vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end),
  vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end),
  vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end),
}
