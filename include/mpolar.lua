-- Marsaglia Polar gaussian transform
local spare
local hasSpare = false



return function(seed, mean, stdDev)
  math.randomseed(seed)
  
  if hasSpare then
    hasSpare = false
    return spare * stdDev + mean
  else
    local u, v, s
    
    repeat
      u = math.random() * 2 - 1
      v = math.random() * 2 - 1
      s = u * u + v * v
    until (s >= 1 or s == 0)
    
    print(s)
    s = math.sqrt(-2 * math.log(s) / s)
    spare = v * s
    hasSpare = true
    return mean + stdDev * u * s
  end
end