-- UI

local window = {
  w = love.graphics.getWidth(),
  h = love.graphics.getHeight()
  }

local padding = 32
local prop = {l = window.w + padding}

local getProp = function(p)
  if p == "l" then
    return window.w + padding
  end
end

local infoBox = function()
  love.graphics.rectangle("line", padding, window.h - window.h/3, window.w-padding*2, window.h/3-padding, 3)
end
