local game = {}
local boxes = require 'tracker/boxTracker'
local anim8 = require 'libraries/anim8-master/anim8'


local sprites = {kitbash = {}, START = {}, SETTINGS = {}}


local function csetScene(sceneKey)
    game.setScene = sceneKey
end


function game:load()
    
    sprites.kitbash.image = love.graphics.newImage('sprites/start_menu/kitbash.png')
    sprites.kitbash.pos = {x = 0 * Screen.resizeValue.w, y = 0 * Screen.resizeValue.h}
    sprites.kitbash.resize = {w = Screen.resizeValue.w * 0.2, h = Screen.resizeValue.h * 0.2}
    sprites.kitbash.grid = anim8.newGrid(sprites.kitbash.image:getWidth(), sprites.kitbash.image:getHeight(), sprites.kitbash.image:getWidth(), sprites.kitbash.image:getHeight())
    sprites.kitbash.animation = anim8.newAnimation(sprites.kitbash.grid(1, 1), 0.1)

    sprites.START.image = love.graphics.newImage('sprites/start_menu/startMenu2/start.png')
    sprites.START.pos = {x = 0 * Screen.resizeValue.w, y = 80 * Screen.resizeValue.h}
    sprites.START.resize = {w = Screen.resizeValue.w * 0.2, h = Screen.resizeValue.h * 0.2}
    sprites.START.grid = anim8.newGrid(sprites.START.image:getWidth(), sprites.START.image:getHeight(), sprites.START.image:getWidth(), sprites.START.image:getHeight())
    sprites.START.animation = anim8.newAnimation(sprites.START.grid(1, 1), 0.1)
    sprites.START.trueWidth = sprites.START.image:getWidth() * sprites.START.resize.w
    sprites.START.trueHeight = sprites.START.image:getHeight() * sprites.START.resize.h

    sprites.SETTINGS.image = love.graphics.newImage('sprites/start_menu/startMenu2/settings.png')
    sprites.SETTINGS.pos = {x = 0 * Screen.resizeValue.w, y = 200 * Screen.resizeValue.h}
    sprites.SETTINGS.resize = {w = Screen.resizeValue.w * 0.2, h = Screen.resizeValue.h * 0.2}
    sprites.SETTINGS.grid = anim8.newGrid(sprites.SETTINGS.image:getWidth(), sprites.SETTINGS.image:getHeight(), sprites.SETTINGS.image:getWidth(), sprites.SETTINGS.image:getHeight())
    sprites.SETTINGS.animation = anim8.newAnimation(sprites.SETTINGS.grid(1, 1), 0.1)
    
    local STARTbox = boxes.newBox(sprites.START.pos.x, sprites.START.pos.y, sprites.START.trueWidth, sprites.START.trueHeight, mouseX, mouseY)

end

function game:keypressed(key, scancode, isrepeat)


end

function game:mousepressed(mouseX, mouseY, button)
    if button and STARTbox == true then
        print("Start button pressed")
    end
end

function game:mousereleased(mouseX, mouseY, button)

end

function game:update(dt)
    
end

function game:draw()
    sprites.kitbash.animation:draw(sprites.kitbash.image, sprites.kitbash.pos.x, sprites.kitbash.pos.y, 0, sprites.kitbash.resize.w, sprites.kitbash.resize.h)
    sprites.START.animation:draw(sprites.START.image, sprites.START.pos.x, sprites.START.pos.y, 0, sprites.START.resize.w, sprites.START.resize.h)
    sprites.SETTINGS.animation:draw(sprites.SETTINGS.image, sprites.SETTINGS.pos.x, sprites.SETTINGS.pos.y, 0, sprites.SETTINGS.resize.w, sprites.SETTINGS.resize.h)
end

return game