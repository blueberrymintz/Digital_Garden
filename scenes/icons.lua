local anim8 = require "libraries.anim8-master.anim8"
local game = {}

local sprites = {}


function game:load()

    sprites.image = {}
    sprites.plant = {}
    sprites.lifting = {}
    sprites.park = {}
    sprites.store = {}
    sprites.waterCan = {}

    sprites.plant.image = love.graphics.newImage("sprites/symbols/plantIcon")
    sprites.lifting.image = love.graphics.newImage("sprites/symbols/plantLiftingIcon")
    sprites.park.image = love.graphics.newImage("sprites/symbols/plantParkIcon")
    sprites.store.image = love.graphics.newImage("sprites/symbols/storeIcon")
    sprites.waterCan.image = love.graphics.newImage("sprites/symbols/wateringCanIcon")

    -- plant icon

    sprites.plant.grid = anim8.newGrid(sprites.plant.image:getWidth(), sprites.plant.image:getHeight(), sprites.plant.image:getWidth(), sprites.plant.image:getHeight())
    sprites.plant.position = {
        x = 50,
        y = 50
    }
    sprites.plant.resize = {
        w = 
    }
    
end

function game:keypressed(key, scancode, isrepeat)


end

function game:mousepressed(mouseX, mouseY, button)

end

function game:mousereleased(mouseX, mouseY, button)

end

function game:update(dt)
    
end

function game:draw()
    
end

return game