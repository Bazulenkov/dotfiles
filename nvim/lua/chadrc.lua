-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onenord",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  statusline = {
    theme = "vscode_colored"
  },
  -- statusline = {
  --   overriden_modules = function()
  --     local fn = vim.fn
  --     local sep_l = ""
  --
  --     return {
  --
  --       cursor_position = function()
  --         local line = fn.line "."
  --         local col = fn.virtcol "."
  --
  --         local chad = string.format(" %d:%d", line, col) .. " │ "
  --
  --         -- default cursor_position module
  --         local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "
  --
  --         local current_line = fn.line "."
  --         local total_line = fn.line "$"
  --         local text = math.modf((current_line / total_line) * 100) .. tostring "%%"
  --         text = string.format("%4s", text)
  --
  --         text = (current_line == 1 and "Top") or text
  --         text = (current_line == total_line and "Bot") or text
  --
  --         return left_sep .. "%#St_pos_text#" .. chad .. text .. " "
  --       end,
  --     }
  --   end,
  -- },
}

return M