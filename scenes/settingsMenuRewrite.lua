local game = {}

local cron = require ('libraries/cronLua_Master/cron')
local anim8 = require 'libraries/anim8-master/anim8'
local boxTracker = require 'tracker/boxTracker'
local keys = require 'tracker/keyTracker'

local sprites = {}

local function csetScene(sceneKey)
    game.setScene(sceneKey)
end


function game:load()

    sprites.settings = {}
    sprites.settings.image = love.graphics.newImage('sprites/settingsMenuRewrite/settingsSprite.png')
    sprites.settings.pos = {x = 0 * Screen.resizeValue.w, y = 0 * Screen.resizeValue.h}
    sprites.settings.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.settings.grid = anim8.newGrid(sprites.settings.image:getWidth(), sprites.settings.image:getHeight(), sprites.settings.image:getWidth(), sprites.settings.image:getHeight())
    sprites.settings.animation = anim8.newAnimation(sprites.settings.grid(1, 1), 0.1)
    sprites.settings.trueWidth = sprites.settings.image:getWidth() * sprites.settings.resize.w
    sprites.settings.trueHeight = sprites.settings.image:getHeight() * sprites.settings.resize.h
    
    sprites.SFX = {}
    sprites.SFX.image = love.graphics.newImage('sprites/settingsMenuRewrite/SFXsprite.png')
    sprites.SFX.pos = {x = 50 * Screen.resizeValue.w, y = 50 * Screen.resizeValue.h}
    sprites.SFX.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.SFX.grid = anim8.newGrid(sprites.SFX.image:getWidth(), sprites.SFX.image:getHeight(), sprites.SFX.image:getWidth(), sprites.SFX.image:getHeight())

    
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
    sprites.settings.animation:draw(sprites.settings.image, sprites.settings.pos.x, sprites.settings.pos.y, 0, sprites.settings.resize.w, sprites.settings.resize.h)
    
end

return game