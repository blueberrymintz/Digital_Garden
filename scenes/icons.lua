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

-- resize for all sprites
sprites.resize = 1
sprites.shift = {
    x = 0,
    y = 0
}

    sprites.plant.image = love.graphics.newImage("sprites/symbols/plantIcon")
    sprites.lifting.image = love.graphics.newImage("sprites/symbols/plantLiftingIcon")
    sprites.park.image = love.graphics.newImage("sprites/symbols/plantParkIcon")
    sprites.store.image = love.graphics.newImage("sprites/symbols/storeIcon")
    sprites.waterCan.image = love.graphics.newImage("sprites/symbols/wateringCanIcon")

    -- plant icon
        sprites.plant.grid = anim8.newGrid(sprites.plant.image:getWidth(), sprites.plant.image:getHeight(), sprites.plant.image:getWidth(), sprites.plant.image:getHeight())
        sprites.plant.position = {
            x = 50 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.plant.resize = {
            w = Screen.resizeValue * sprites.resize,
            h = Screen.resizeValue * sprites.resize
        }
        sprites.plant.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
        sprites.plant.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h

    -- lifting icon
        sprites.lifting.grid = anim8.newGrid(sprites.lifting.image:getWidth(), sprites.lifting.image:getHeight(), sprites.lifting.image:getWidth(), sprites.lifting.image:getHeight())
        sprites.lifting.position = {
            x = 100 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.lifting.resize = {
            w = Screen.resizeValue * sprites.resize,
            h = Screen.resizeValue * sprites.resize
        }
        sprites.plant.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
        sprites.plant.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h

    -- park icon
        sprites.park.grid = anim8.newGrid(sprites.park.image:getWidth(), sprites.lifting.image:getHeight(), sprites.lifting.image:getWidth(), sprites.lifting.image:getHeight())
        sprites.park.position = {
            x = 150 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.park.resize = {
            w = Screen.resizeValue * sprites.resize,
            h = Screen.resizeValue * sprites.resize
        }
        sprites.park.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
        sprites.park.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h

    -- store icon
        sprites.store.grid = anim8.newGrid(sprites.store.image:getWidth(), sprites.store.image:getHeight(), sprites.store.image:getWidth(), sprites.store.image:getHeight())
        sprites.store.position = {
            x = 200 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.store.resize = {
            w = Screen.resizeValue * sprites.resize,
            h = Screen.resizeValue * sprites.resize
        }
        sprites.store.trueWidth = sprites.store.image:getWidth() * sprites.store.resize.w
        sprites.store.trueHeight = sprites.store.image:getHeight() * sprites.store.resize.h

    -- watering can icon
        sprites.waterCan.grid = anim8.newGrid(sprites.waterCan.image:getWidth(). sprites.waterCan.image:getHeight(), sprites.waterCan.image:getWidth(), sprites.waterCan.image:getHeight())
        sprites.waterCan.position = {
            x = 250 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.waterCan.resize = {
            w = Screen.resizeValue * sprites.resize,
            h = Screen.resizeValue * sprites.resize
        }
        sprites.waterCan.trueWidth = sprites.waterCan.image:getWidth() * sprites.store.resize.w
        sprites.waterCan.trueWidth = sprites.waterCan.image:getHeight() * sprites.waterCan.resize.h


 -- ALL animations
        sprites.plant.animation = {
        a = anim8.newAnimation(sprites.plant.grid( 1, 1), 1)
        }

        sprites.lifting.animation = {
        a = anim8.newAnimation(sprites.lifting.grid( 1, 1), 1)
        }

        sprites.park.animation = {
        a = anim8.newAnimation(sprites.park.grid( 1, 1), 1)
        }
        
        sprites.store.animation = {
        a = anim8.newAnimation(sprites.store.grid( 1, 1), 1)
        }

        sprites.waterCan.animation = {
        a = anim8.newAnimation(sprites.waterCan.grid( 1, 1), 1)
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