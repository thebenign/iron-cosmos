-- Planet Generator

local hash = require("include/wanghash")

local draw = function(r)
  
end

local makePlanet = function(s, p)
  
  local planet = {
    properties = {
      temp = hash(31*s+p)*400-200
    }
  }
  
  return planet
end

local attr = {}

attr.live = function(entity)
  entity.live = true
end

local function hasProperty(prop_list)
end

return makePlanet