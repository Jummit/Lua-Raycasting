local raycast = require("raycast")

return function()
  local world = {
    render = function(self, lights)
      -- go over every tile
      for y = 1, #self.tiles do
        for x = 1, #self.tiles[y] do
          -- find out if any lamp is placed here, if so render it instead of the tile
          local isLamp = false
          for _, light in ipairs(lights) do
            if light.x == x and light.y == y then
              isLamp = true
              io.write("o")
            end
          end

          -- if no lamp is rendered, render the tile
          if not isLamp then
            -- look if the tile is lit by any lamp
            if raycast.isLit(x, y, lights, self) then
              io.write(self.tileset[self.tiles[y][x]])
            else
              io.write(".")
            end
          end
        end
        io.write("\n")
      end
    end
  }

  world.tileset = {}
  world.tiles = {}

  return world
end
