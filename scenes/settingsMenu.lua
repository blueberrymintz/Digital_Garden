local game = {}
local cron = require('libraries/cronLua_Master/cron')
local boxTracker = require 'tracker/boxTracker'
local mousePos = {}
mousePos.x = 0
mousePos.y = 0
local resize = 0.5
local resizeToggle = 0.3
local function csetScene(foo)
    game.setScene(foo)
end
    local clockCallMusic = 1
    local clockCallSFX = 1
    local clockCallBackArrow = 1
-- warps back to start menu
local backArrowClock = cron.after(0.05, csetScene, 'startMenu')
local function toggleMusic()
    if settingsMenu.musicToggleGridX == 1 then
        settingsMenu.musicToggleGridX = 2
        -- code to stop music
        print("Music toggled off")
    else
        settingsMenu.musicToggleGridX = 1
        -- code to play music
        print("Music toggled on")
    end
    settingsMenu.animations.musicToggle = anim8.newAnimation(settingsMenu.toggleGrid(settingsMenu.musicToggleGridX, 1), 1)
end
local function toggleSFX()
    if settingsMenu.sfxToggleGridX == 1 then
        settingsMenu.sfxToggleGridX = 2
        -- code to stop SFX
        print("SFX toggled off")
    else
        settingsMenu.sfxToggleGridX = 1
        -- code to play SFX
        print("SFX toggled on")
    end
    settingsMenu.animations.sfxToggle = anim8.newAnimation(settingsMenu.toggleGrid(settingsMenu.sfxToggleGridX, 1), 1)

end
-- toggle clocks
local toggleClockMusic = cron.after(0.01, toggleMusic)
local toggleClockSFX = cron.after(0.01, toggleSFX)
function game:mousepressed(mouseX, mouseY, button)
    if button then
        print('Mouse X:' .. mouseX .. '  Mouse Y:' .. mouseY .. '  Button:' .. button)
    end
    if BoxTracker2(200, 85, 50, 50, mouseX, mouseY) == 1 then
        print("Music Toggle Clicked")
        clockCallMusic = 2
    end
    if BoxTracker2(200, 135, 50, 50, mouseX, mouseY) == 1 then
        print("SFX Toggle Clicked")
        clockCallSFX = 2
    end
    if BoxTracker2(400, 10, 100, 100, mouseX, mouseY) == 1 then
        print("Back Arrow Clicked")
        clockCallBackArrow = 2
    end
end

function game:mousereleased(mouseX, mouseY, button)

end


function game:load()
    --prints to terminal
    print("Warp Successful! Current Scene: Settings Menu")
            settingsMenu = {}
        -- initializes the start menu sprites and animations
        -- DO NOT DELETE THIS
settingsMenu.musicToggleGridX = 1
settingsMenu.sfxToggleGridX = 1
settingsMenu.backArrowGridX = 1

settingsMenu.sprite = love.graphics.newImage('sprites/settings/sprite_sheet(6).png')
settingsMenu.toggleSprite = love.graphics.newImage('sprites/settings/toggleSheet.png')
settingsMenu.backArrowSprite = love.graphics.newImage('sprites/settings/backArrowSpriteSheet.png')

settingsMenu.grid = anim8.newGrid((settingsMenu.sprite:getWidth())/2, settingsMenu.sprite:getHeight()/2, settingsMenu.sprite:getWidth(), settingsMenu.sprite:getHeight())
settingsMenu.toggleGrid = anim8.newGrid((settingsMenu.toggleSprite:getWidth()/2), settingsMenu.toggleSprite:getHeight(), settingsMenu.toggleSprite:getWidth(), settingsMenu.toggleSprite:getHeight())
settingsMenu.backArrowGrid = anim8.newGrid((settingsMenu.backArrowSprite:getWidth()/2), settingsMenu.backArrowSprite:getHeight(), settingsMenu.backArrowSprite:getWidth(), settingsMenu.backArrowSprite:getHeight())

settingsMenu.animations = {}
settingsMenu.animations.background = anim8.newAnimation(settingsMenu.grid(1, 2), 0.1)
settingsMenu.animations.musicToggle = anim8.newAnimation(settingsMenu.toggleGrid(settingsMenu.musicToggleGridX, 1), 1)
settingsMenu.animations.sfxToggle = anim8.newAnimation(settingsMenu.toggleGrid(settingsMenu.sfxToggleGridX, 1), 1)
settingsMenu.animations.backArrow = anim8.newAnimation(settingsMenu.backArrowGrid(settingsMenu.backArrowGridX, 1), 1)


end


function game:keypressed(key)
    if key == 'm' then
        toggleClockMusic:update(1)
    end
    if key == 's' then
        toggleClockSFX:update(1)
    end
    if key == 'escape' then
        backArrowClock:update(1)
    end
end

function game:update(dt)
        toggleClockMusic:update(dt)

        toggleClockMusic:reset()


        toggleClockSFX:update(dt)
    
        toggleClockSFX:reset()





        backArrowClock:update(dt)



        backArrowClock:reset()
    
    settingsMenu.animations.backArrow = anim8.newAnimation(settingsMenu.backArrowGrid(settingsMenu.backArrowGridX, 1), 1)
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    --background to black
    love.graphics.setBackgroundColor(0,0,0)
    --draws to screen
    settingsMenu.animations.background:draw(settingsMenu.sprite, 0, 0, nil, resize)
    settingsMenu.animations.sfxToggle:draw(settingsMenu.toggleSprite, 200, 85, nil, resizeToggle)
    settingsMenu.animations.musicToggle:draw(settingsMenu.toggleSprite, 200, 135, nil, resizeToggle)
    settingsMenu.animations.backArrow:draw(settingsMenu.backArrowSprite, 400, 10, nil, 0.8)
    love.graphics.rectangle('line',200,180,50,100)
end

return game