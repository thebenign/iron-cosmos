-- LuaJIT Wang Hash

local bit = require("bit")

local const32 = 2147483647

local function hash(a)
  a = bit.bxor(bit.bxor(a, 61), bit.arshift(a, 16))
  a = a + bit.arshift(a, -3)
  a = bit.bxor(a, bit.arshift(a, 4))
  a = a * 0x27d4eb2d
  a = bit.bxor(a, bit.arshift(a, 15))
  return a
end

return hash