script.on_init(function()
  storage.bots_frozen = {}
  storage.original_speed = {}
end)

script.on_configuration_changed(function()
  storage.bots_frozen = storage.bots_frozen or {}
  storage.original_speed = storage.original_speed or {}
end)

local FREEZE_SPEED = -0.99  -- Results in 1% of base speed

local function toggle_bots(player)
  local force = player.force
  local force_index = force.index
  
  if storage.bots_frozen[force_index] then
    -- Unfreeze: restore original speed
    force.worker_robots_speed_modifier = storage.original_speed[force_index] or 0
    storage.bots_frozen[force_index] = false
    player.print("Bots unfrozen")
    player.set_shortcut_toggled("freeze-bots-shortcut", false)
  else
    -- Freeze: store current speed and apply freeze
    storage.original_speed[force_index] = force.worker_robots_speed_modifier
    force.worker_robots_speed_modifier = FREEZE_SPEED
    storage.bots_frozen[force_index] = true
    player.print("Bots frozen")
    player.set_shortcut_toggled("freeze-bots-shortcut", true)
  end
end

script.on_event("toggle-freeze-bots", function(event)
  local player = game.get_player(event.player_index)
  if player then
    toggle_bots(player)
  end
end)

script.on_event(defines.events.on_lua_shortcut, function(event)
  if event.prototype_name == "freeze-bots-shortcut" then
    local player = game.get_player(event.player_index)
    if player then
      toggle_bots(player)
    end
  end
end)