-- libraries

local anim8 = require("libraries/anim8-master/anim8")
local boxes = require("tracker/boxTracker")



local game = {}

local function csetScene(scene)
    -- this function is used to change the scene and set the last scene
    LastScene = GlobalCurrentScene
    game.setScene(scene)
end

local sprites = {}


function game:load()

    sprites.image = {}
    sprites.plant = {}
    sprites.lifting = {}
    sprites.park = {}
    sprites.store = {}
    sprites.waterCan = {}

-- resize for all sprites
sprites.resize = 0.06
sprites.shift = {
    x = 0,
    y = 100
}

    sprites.plant.image = love.graphics.newImage("sprites/symbols/plantIcon.png")
    sprites.lifting.image = love.graphics.newImage("sprites/symbols/plantLiftingIcon.png")
    sprites.park.image = love.graphics.newImage("sprites/symbols/plantParkIcon.png")
    sprites.store.image = love.graphics.newImage("sprites/symbols/storeIcon.png")
    sprites.waterCan.image = love.graphics.newImage("sprites/symbols/wateringCanIcon.png")

    -- plant icon
        sprites.plant.grid = anim8.newGrid(sprites.plant.image:getWidth(), sprites.plant.image:getHeight(), sprites.plant.image:getWidth(), sprites.plant.image:getHeight())
        sprites.plant.pos = {
            x = 50 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.plant.resize = {
            w = Screen.resizeValue.w * sprites.resize,
            h = Screen.resizeValue.h * sprites.resize
        }
        sprites.plant.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
        sprites.plant.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h

    -- lifting icon
        sprites.lifting.grid = anim8.newGrid(sprites.lifting.image:getWidth(), sprites.lifting.image:getHeight(), sprites.lifting.image:getWidth(), sprites.lifting.image:getHeight())
        sprites.lifting.pos = {
            x = 150 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.lifting.resize = {
            w = Screen.resizeValue.w * sprites.resize,
            h = Screen.resizeValue.h * sprites.resize
        }
        sprites.lifting.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
        sprites.lifting.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h

    -- park icon
        sprites.park.grid = anim8.newGrid(sprites.park.image:getWidth(), sprites.lifting.image:getHeight(), sprites.lifting.image:getWidth(), sprites.lifting.image:getHeight())
        sprites.park.pos = {
            x = 250 + sprites.shift.x,
            y = 50 + sprites.shift.y
        }
        sprites.park.resize = {
            w = Screen.resizeValue.w * sprites.resize,
            h = Screen.resizeValue.h * sprites.resize
        }
        sprites.park.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
        sprites.park.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h

    -- store icon
        sprites.store.grid = anim8.newGrid(sprites.store.image:getWidth(), sprites.store.image:getHeight(), sprites.store.image:getWidth(), sprites.store.image:getHeight())
        sprites.store.pos = {
            x = 50 + sprites.shift.x,
            y = 200 + sprites.shift.y
        }
        sprites.store.resize = {
            w = Screen.resizeValue.w * sprites.resize,
            h = Screen.resizeValue.h * sprites.resize
        }
        sprites.store.trueWidth = sprites.store.image:getWidth() * sprites.store.resize.w
        sprites.store.trueHeight = sprites.store.image:getHeight() * sprites.store.resize.h

    -- watering can icon
        sprites.waterCan.grid = anim8.newGrid(sprites.waterCan.image:getWidth(), sprites.waterCan.image:getHeight(), sprites.waterCan.image:getWidth(), sprites.waterCan.image:getHeight())
        sprites.waterCan.pos = {
            x = 150 + sprites.shift.x,
            y = 200 + sprites.shift.y
        }
        sprites.waterCan.resize = {
            w = Screen.resizeValue.w * sprites.resize,
            h = Screen.resizeValue.h * sprites.resize
        }
        sprites.waterCan.trueWidth = sprites.waterCan.image:getWidth() * sprites.store.resize.w
        sprites.waterCan.trueHeight = sprites.waterCan.image:getHeight() * sprites.waterCan.resize.h

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
    if key == 'escape' then
        csetScene(LastScene)
    end

end

function game:mousepressed(mouseX, mouseY, button)
    sprites.plant.box = BoxTracker2(sprites.plant.pos.x, sprites.plant.pos.y, sprites.plant.trueWidth, sprites.plant.trueHeight, mouseX, mouseY)
    sprites.lifting.box = BoxTracker2(sprites.lifting.pos.x, sprites.lifting.pos.y, sprites.lifting.trueWidth, sprites.lifting.trueHeight, mouseX, mouseY)
    sprites.park.box = BoxTracker2(sprites.park.pos.x, sprites.park.pos.y, sprites.park.trueWidth, sprites.park.trueHeight)
    sprites.store.box = BoxTracker2(sprites.store.pos.x, sprites.store.pos.y, sprites.store.trueWidth, sprites.store.trueHeight)
    sprites.waterCan.box = BoxTracker2(sprites.waterCan.pos.x, sprites.waterCan.pos.x, sprites.waterCan.trueWidth, sprites.waterCan.trueHeight)

    if button then
        if sprites.plant.box then
            print("plant clicked")
        end
        if sprites.lifting.box then
            print("lifting clicked")
        end
        if sprites.park.box then
            print("park clicked")
        end
        if sprites.store.box then
            print("store clicked")
        end
        if sprites.waterCan.box then
            print("waterCan clicked")
        end

    end

end

function game:mousereleased(mouseX, mouseY, button)
    sprites.plant.box = BoxTracker2(sprites.plant.pos.x, sprites.plant.pos.y, sprites.plant.trueWidth, sprites.plant.trueHeight, mouseX, mouseY)
    sprites.lifting.box = BoxTracker2(sprites.lifting.pos.x, sprites.lifting.pos.y, sprites.lifting.trueWidth, sprites.lifting.trueHeight, mouseX, mouseY)
    sprites.park.box = BoxTracker2(sprites.park.pos.x, sprites.park.pos.y, sprites.park.trueWidth, sprites.park.trueHeight)
    sprites.store.box = BoxTracker2(sprites.store.pos.x, sprites.store.pos.y, sprites.store.trueWidth, sprites.store.trueHeight)
    sprites.waterCan.box = BoxTracker2(sprites.waterCan.pos.x, sprites.waterCan.pos.x, sprites.waterCan.trueWidth, sprites.waterCan.trueHeight)

    if button then
        if sprites.plant.box then
            print("plant clicked")
            csetScene("homeGardenRewrite")
        end
        if sprites.lifting.box then
            print("lifting clicked")
        end
        if sprites.park.box then
            print("park clicked")
        end
        if sprites.store.box then
            print("store clicked")
        end
        if sprites.waterCan.box then
            print("waterCan clicked")
        end

    end

end

function game:update(dt)
    
end

function game:draw()
    sprites.plant.animation.a:draw(sprites.plant.image, sprites.plant.pos.x, sprites.plant.pos.y, 0, sprites.plant.resize.w, sprites.plant.resize.h)
    sprites.lifting.animation.a:draw(sprites.lifting.image, sprites.lifting.pos.x, sprites.lifting.pos.y, 0, sprites.lifting.resize.w, sprites.lifting.resize.h)
    sprites.park.animation.a:draw(sprites.park.image, sprites.park.pos.x, sprites.park.pos.y, sprites.park.resize.w, sprites.park.resize.h)
    sprites.store.animation.a:draw(sprites.store.image, sprites.store.pos.x, sprites.store.pos.y, 0, sprites.store.resize.w, sprites.store.resize.h)
    sprites.waterCan.animation.a:draw(sprites.waterCan.image, sprites.waterCan.pos.x, sprites.waterCan.pos.y, 0, sprites.waterCan.resize.w, sprites.waterCan.resize.h)
end

return game