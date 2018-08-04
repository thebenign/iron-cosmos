-- System Generator

local hash = require("include/wanghash")
local mpolar = require("include/mpolar")

local stellar_class = {"O","B","A","F","G","K","M"}
local spectral_class = {"blue","blue-white","white","yellow-white","yellow","light orange", "orange red"}
local class_descriptor = {"hypergiant","supergiant","bright giant","giant","subgiant","dwarf","subdwarf"}

local temp_class = {30000,10000,7500,6000,5200,3700}

local sys_table = {}
sys_table.__index = sys_table

function sys_table:stellar()
  return stellar_class[self.star.class]
end
function sys_table:spectral()
  return spectral_class[self.star.class]
end
function sys_table:descriptor()
  return class_descriptor[self.star.class]
end

local makeSystem = function(s)
  -- Due to an inherent flaw in the RNG caused by losing the low bit in the integer > real number conversion, 
  -- the first random number is not reliable so we throw away the first random value.
  -- http://lua-users.org/lists/lua-l/2007-03/msg00564.html
  
  local system_seed = hash(s) -- get a new seed for the system
  love.math.setRandomSeed(system_seed)
  local _ = love.math.randomNormal(1,0) -- chuck it away
  
  local deviation = love.math.randomNormal(1,0)  -- new normalized "gaussian" distributed number
  
  if deviation < 0 then
    deviation = (math.abs(deviation)^0.25)*-1  -- roll off negative deviations for a skewed curve
  end
  local origin = deviation
  print("Seed: "..system_seed.."; "..deviation)
  
  local temp = 10000*deviation+5000  -- shift the mean to a reasonable average
  
  if temp < 2400 then temp = 2400 end
  if temp > 100000 then temp = 100000 end
  
  local class = 0
  
  for i = 1, 6 do
    if temp >= temp_class[i] then
      class = i
      break
    end
    class = 7
  end
  
  local system = {
    star = {
      deviation = origin,
      class = class,
      temp = temp,
    }
  }
  
  setmetatable(system, sys_table)
  
  return system
end

return makeSystem