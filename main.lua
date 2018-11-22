local world = require("world")()

world.tiles = {
  {0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0},
  {0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0},
  {0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0},
  {0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0},
  {0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0}
}
for y = 1, 20 do
  world.tiles[y] = {}
  for x = 1, 100 do
    world.tiles[y][x] = 0
  end
end
for i = 1, 120 do
  local x = math.random(1, 99)
  local y = math.random(1, 19)
  world.tiles[y][x] = 1
  world.tiles[y][x+1] = 1
  world.tiles[y+1][x] = 1
  world.tiles[y+1][x+1] = 1
end
world.tileset = {
  [0] = " ",
  [1] = "#"
}
world.solidTiles = {
  [1] = true
}

local lights = {
  {
    x = 7,
    y = 4
  }
}

local function handleInput(i)
  if i == "d" then
    lights[1].x = lights[1].x + 1
  elseif i == "a" then
    lights[1].x = lights[1].x - 1
  elseif i == "w" then
    lights[1].y = lights[1].y - 1
  elseif i == "s" then
    lights[1].y = lights[1].y + 1
  end
  os.execute("clear")
  world:render(lights)
  os.execute("sleep 0.01")
end

while true do
  local i = io.read()
  for x = 1, #i do
    handleInput(string.sub(i, x, x))
  end
end
