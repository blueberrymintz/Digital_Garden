local game = {}
local anim8 = require 'libraries.anim8-master.anim8'
local cron = require "libraries.cronLua_Master.cron"
local boxTracker = require 'tracker.boxTracker'
local keys = require 'tracker.keyTracker'


local sprites = {}


function game:load()
    print("Warp Successful! Current Scene: Home Garden Rewrite")
    sprites.background = {}

    sprites.background.image = love.graphics.newImage('sprites/homeGardenRewrite/plantsBackgroundSprite.png')
    sprites.background.pos = {x = 0 * Screen.resizeValue.w, y = 0 * Screen.resizeValue.h}
    sprites.background.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.background.grid = anim8.newGrid(sprites.background.image:getWidth(), sprites.background.image:getHeight(), sprites.background.image:getWidth(), sprites.background.image:getHeight())
    sprites.background.animation = anim8.newAnimation(sprites.background.grid(1, 1), 0.1)
    sprites.background.trueWidth = sprites.background.image:getWidth() * sprites.background.resize.w
    sprites.background.trueHeight = sprites.background.image:getHeight() * sprites.background.resize.h

    sprites.plant = {}
    sprites.plant.image = love.graphics.newImage('sprites/homeGardenRewrite/plantSymbolsBW2.png')
    sprites.plant.pos = {x = 50 * Screen.resizeValue.w, y = 300 * Screen.resizeValue.h}
    sprites.plant.resize = {w = Screen.resizeValue.w * 0.1, h = Screen.resizeValue.h * 0.1}
    sprites.plant.grid = anim8.newGrid(sprites.plant.image:getWidth(), sprites.plant.image:getHeight(), sprites.plant.image:getWidth(), sprites.plant.image:getHeight())
    sprites.plant.animation = anim8.newAnimation(sprites.plant.grid(1, 1), 0.1)
    sprites.plant.trueWidth = sprites.plant.image:getWidth() * sprites.plant.resize.w
    sprites.plant.trueHeight = sprites.plant.image:getHeight() * sprites.plant.resize.h




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
    sprites.background.animation:draw(sprites.background.image, sprites.background.pos.x, sprites.background.pos.y, 0, sprites.background.resize.w, sprites.background.resize.h)
    sprites.plant.animation:draw(sprites.plant.image, sprites.plant.pos.x, sprites.plant.pos.y, 0, sprites.plant.resize.w, sprites.plant.resize.h)
end

return game