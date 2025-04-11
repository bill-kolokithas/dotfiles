return {
  "monaqa/dial.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end },
    { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end }
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group{
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.constant.alias.bool,
        augend.semver.alias.semver,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%m/%d"],
        augend.date.alias["%H:%M"]
      }
    }
  end
}
