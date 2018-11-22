local world = require("world")()

local w, h = 100, 20

world.tiles = {}

-- generate the floor
for y = 1, 20 do
  world.tiles[y] = {}
  for x = 1, 100 do
    world.tiles[y][x] = 0
  end
end

-- generate chunks of solid tiles
for i = 1, 120 do
  local x = math.random(1, w-1)
  local y = math.random(1, h-1)
  world.tiles[y][x] = 1
  world.tiles[y][x+1] = 1
  world.tiles[y+1][x] = 1
  world.tiles[y+1][x+1] = 1
end

-- generate coins
for i = 1, 20 do
  world.tiles[math.random(1, h)][math.random(1, w)] = 2
end

world.tileset = {
  [0] = " ",
  [1] = "#",
  [2] = "*"
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
  if world.tiles[lights[1].y][lights[1].x] == 2 then
    world.tiles[lights[1].y][lights[1].x] = 0
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
