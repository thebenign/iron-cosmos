-- distribution functions

local add = function(self, x)
  self.sum = self.sum + x
  self.n = self.n + 1
  self.set[self.n] = x
  self.mean = self.sum / self.n
end


local diffSqr = function(self, n)
  return (self.set[n] - self.mean)^2
end

local getStdev = function(self)
  local sum = 0
  if self.n < 2 then
    return 0
  end
  for i = 1, self.n do
    sum = sum + diffSqr(self, i)
  end
  return math.sqrt(sum / self.n)
end

local getDev = function(self, n)
  return self.set[n] - self.mean
end


local reset = function(self)
  self.sum = 0
  self.n = 0
  self.mean = 0
  self.set = {}
end


return function()
  return {
  sum = 0,
  n = 0,
  mean = 0,
  set = {},
  st_dev = 0,
  dev_ready = false,
  
  add = add,
  reset = reset,
  getStdev = getStdev,
  getDev = getDev
}
end