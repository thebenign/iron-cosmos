love.window.setMode(384, 640)

local image = require("include/load_images")
local wanghash = require("include/wanghash")
local makePlanet = require("include/planet")
local makeSystem = require("include/system")
local stat = require("include/dist")

local ui = require("include/ui")

local stars_data = stat()

local font = love.graphics.setNewFont("fonts/SourceCodePro_FontsOnly-1.009/SourceCodePro-Regular.ttf", 13)
font:setFilter("linear","linear",3)

local seed = 1
local state = 0

local bg_data = love.image.newImageData(360, 640)
local bg_img

local system = makeSystem(seed)

local window = {
  width = 360,
  height = 640,
  }

-- state 0 = menu, 1 = on-planet, 2 = traveling

local world = {
  system = {}
}

local player = {
  system = 0
}

-- Location should be defined as 2 dimensional point in the world table [system][planet]

local function findScreenCenter()
  window.mid_x = math.floor(love.graphics.getWidth()/2)
  window.mid_y = math.floor(love.graphics.getHeight()/2)
end

function love.load()
  player.system = math.random(10000)
  findScreenCenter()
  
  
  
  --[[bg_data:mapPixel(
    function (x, y)
      local ans = math.floor(wanghash(397*y+x)*255)
      return 255, 255, 255, ans
    end)
  
  bg_img = love.graphics.newImage(bg_data)]]
end

function love.update(dt)
  
end

function love.mousepressed(x, y, b, isTouch)
  if isTouch or b == 1 then
    seed = seed + 1
  end
  if b == 2 then
    seed = seed - 1
  end
  system = makeSystem(seed)
  stars_data:add(system.star.deviation)
end

function love.keyreleased(k)
  if k == "escape" then
    os.exit()
  end
end

function love.draw()
  --love.graphics.draw(bg_img, 0,0)
  --love.graphics.draw(image.planet[1],window.mid_x-150,window.mid_y-150)

  ui.infoBox("Arriving in star system "..string.format("%x",tostring(seed))..
    "\nOur local star is a class "..system:stellar().." "..system:descriptor()..
    "\nWith a temperature of "..math.ceil(system.star.temp).." K")
  
  --love.graphics.setColor(76,255,79)
  --love.graphics.print("Standard Deviation: "..stars_data:getStdev(), 32, 600)
  
end