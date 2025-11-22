data:extend({
  {
    type = "custom-input",
    name = "toggle-freeze-bots",
    key_sequence = "SHIFT + B",
    action = "lua"
  },
  {
    type = "shortcut",
    name = "freeze-bots-shortcut",
    action = "lua",
    associated_control_input = "toggle-freeze-bots",
    icon = "__freeze-bots__/graphics/icons/frozen-bot.png",
    icon_size = 64,
    small_icon = "__freeze-bots__/graphics/icons/frozen-bot.png",
    small_icon_size = 64,
    toggleable = true
  }
})