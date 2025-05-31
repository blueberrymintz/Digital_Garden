local game = {}
local boxTracker = require 'tracker/boxTracker'
local mousePos = {}
mousePos.x = 0
mousePos.y = 0
local resize = 0.5
local resizeToggle = 0.25
function game:load()
    --prints to terminal
    print("Warp Successful! Current Scene: Settings (placeholder)")
            settingsMenu = {}
        -- initializes the start menu sprites and animations
        -- DO NOT DELETE THIS
settingsMenu.musicToggleGridX = 1
settingsMenu.sfxToggleGridX = 1

settingsMenu.sprite = love.graphics.newImage('sprites/settings/sprite_sheet(6).png')
settingsMenu.toggleSprite = love.graphics.newImage('sprites/settings/toggleSheet.png')

settingsMenu.grid = anim8.newGrid((settingsMenu.sprite:getWidth())/2, settingsMenu.sprite:getHeight()/2, settingsMenu.sprite:getWidth(), settingsMenu.sprite:getHeight())
settingsMenu.toggleGrid = anim8.newGrid((settingsMenu.toggleSprite:getWidth()/2), settingsMenu.toggleSprite:getHeight(), settingsMenu.toggleSprite:getWidth(), settingsMenu.toggleSprite:getHeight())

settingsMenu.animations = {}
settingsMenu.animations.background = anim8.newAnimation(settingsMenu.grid(1, 2), 0.1)
settingsMenu.animations.musicToggle = anim8.newAnimation(settingsMenu.toggleGrid(settingsMenu.musicToggleGridX, 1), 1)
settingsMenu.animations.sfxToggle = anim8.newAnimation(settingsMenu.toggleGrid(settingsMenu.sfxToggleGridX, 1), 1)
end

function game:update(dt)
        -- necessary. I don't know why but don't delete it, it's the only way we got it to work
    settingsMenu.animations.grow = anim8.newAnimation(settingsMenu.grid(1, 1), 0.1)
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    --background to blackd
    love.graphics.setBackgroundColor(0,0,0)
    --draws to screen
    settingsMenu.animations.background:draw(settingsMenu.sprite, 0, 0, nil, resize)
    settingsMenu.animations.musicToggle:draw(settingsMenu.toggleSprite, 175, 65, nil, resizeToggle)
    settingsMenu.animations.sfxToggle:draw(settingsMenu.toggleSprite, 175, 115, nil, resizeToggle)
end

return game