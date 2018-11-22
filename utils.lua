local utils = {}

-- function to find out the length of a vector
function utils.mag(x, y)
  return math.sqrt(x*x + y*y)
end

function utils.normalized(x, y)
  local mag = utils.mag(x, y)
  return x / mag, y / mag
end

return utils
