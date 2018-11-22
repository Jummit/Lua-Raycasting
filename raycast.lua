local utils = require "utils"
local raycast = {}

function raycast.isLit(x, y, lights, world)
  -- go over every light and move from it to the tile
  -- check if there are solid tiles between them

  for _, light in ipairs(lights) do
    -- ray movement delta
    local dx, dy = utils.normalized(x-light.x, y-light.y)

    -- current position
    local cx, cy = light.x, light.y

    while true do
      -- check if the light reached the tile to check (cx == x)
      -- check if it is solid
      -- move current position

      if math.abs(cx - x) < 1 and math.ceil(cy) == y then
        -- light reached the tile!
        return true
      end

      if world.tiles[math.ceil(cy)] and world.solidTiles[world.tiles[math.ceil(cy)][math.ceil(cx)]] then
        -- there is a solid tile between the lamp and the tile to check
        break
      end

      cx, cy = cx + dx, cy + dy
    end
  end
  return false
end

return raycast
