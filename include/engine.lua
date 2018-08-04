-- engine classes

local point = {}
point.__index = point

point.new = function(x, y, z)
  return setmetatable({x = x, y = y, z = z}, point)
end

point.addVectorToPoint = function(self, vec)
  self.x = self.x + vec.x
  self.y = self.y + vec.y
  self.z = self.z + vec.z
end

point.subtractVectorFromPoint = function(self, vec)
  self.x = self.x - vec.x
  self.y = self.y - vec.y
  self.z = self.z - vec.z
end

point.subtractPointFromPoint = function(self, point)
  self.x = self.x - point.x
  self.y = self.y - point.y
  self.z = self.z - point.z
end

point.draw = function(self)
  print("("..self.x..", "..self.y", "..self.z..")")
end

local vec = {}

vec.new = function(x, y, z)
  return setmetatable({x = x, y = y, z = z}, vec)
end

vec.addVector = function(self, vec)
  self.x = self.x + vec.x
  self.y = self.y + vec.y
  self.z = self.z + vec.z
end

vec.subtractVector = function(self, vec)
  self.x = self.x - vec.x
  self.y = self.y - vec.y
  self.z = self.z - vec.z
end