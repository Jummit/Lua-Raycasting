local utils = {}

function utils.distance(x1, y1, x2, y2)
  return math.sqrt(x1*x2+y1*y2)
end

function utils.mag(x, y)
  return math.sqrt(x*x + y*y)
end

function utils.normalized(x, y)
  local mag = utils.mag(x, y)
  return x / mag, y / mag
end

return utils
