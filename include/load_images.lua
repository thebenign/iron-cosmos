-- Load images

local wd = love.filesystem.getWorkingDirectory()

local image = {
  planet = {}
}
local files = {}

-- planets

files = love.filesystem.getDirectoryItems("img/")
for i = 1, #files do
  image.planet[i] = love.graphics.newImage("img/"..files[i])
end


return image