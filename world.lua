local raycast = require("raycast")

return function()
  local world = {
    render = function(self, lights)
      for y = 1, #self.tiles do
        for x = 1, #self.tiles[y] do
          local isLamp = false
          for _, light in ipairs(lights) do
            if light.x == x and light.y == y then
              isLamp = true
              io.write("o")
            end
          end
          if not isLamp and raycast.isLit(x, y, lights, self) then
            io.write(self.tileset[self.tiles[y][x]])
          else
            io.write(".")
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
