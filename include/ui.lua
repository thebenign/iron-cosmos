-- UI

local window = {
  w = love.graphics.getWidth(),
  h = love.graphics.getHeight()
  }

local padding = 32
local margin = 16
local prop = {l = window.w + padding}
local color = {160,220,255,128}

local getProp = function(p)
  if p == "l" then
    return window.w + padding
  end
end

local infoBox = function(t)
  
  love.graphics.setColor(158,182,255,20)
  love.graphics.rectangle("fill", padding, window.h - window.h/3, window.w-padding*2, window.h/3-padding, 3)
  
  love.graphics.setColor(color)
  love.graphics.setBlendMode("add")
  for i = 8, 1, -1 do
    love.graphics.setLineWidth(i*.25)
    love.graphics.rectangle("line", padding-i, window.h - window.h/3-i, window.w-padding*2+i*2, window.h/3-padding+i*2, i*3)
  end
  
  love.graphics.setBlendMode("alpha")
  love.graphics.setColor(255,255,255,255)
  love.graphics.printf(t, padding+margin, window.h-window.h/3+margin, window.w-padding*2-margin*2)
  
end

return {getProp = getProp, infoBox = infoBox}