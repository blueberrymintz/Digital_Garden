local game = {}
-- cron library, for clocks
local cron = require('libraries/cronLua_Master/cron')
-- mouse positioning tracker
local mousePos = {}
local boxTracker = require('tracker/boxTracker')
mousePos.x = 0
mousePos.y = 0
-- gets the transition to garden scene
-- DO NOT DELETE THIS
local function csetScene(foo)
    game.setScene(foo)
end
-- starts the clocks for the start menu and settings menu
-- DO NOT DELETE THESE
local startClock = cron.after(1, csetScene, 'garden')
local settingsClock = cron.after(1, csetScene, 'settings')
function game:load()
        startMenu = {}
        -- initializes the start menu sprites and animations
        -- DO NOT DELETE THIS
startMenu.gridX = 1
startMenu.sprite = love.graphics.newImage('sprites/scuffed_menu/JJmenu/sprite_sheet.png')
startMenu.grid = anim8.newGrid((startMenu.sprite:getWidth()/5), startMenu.sprite:getHeight(), startMenu.sprite:getWidth(), startMenu.sprite:getHeight())
startMenu.animations = {}
startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)
-- loads song for start menu
song = love.audio.newSource('sounds/organLaughing2.ogg', 'stream')
-- sets song to loop        
song:setLooping(true)
song:setVolume(2)
        
end

function game:update(dt)
    --plays the song
    song:play()
    --updates if mouse is Down. MUST be in update function
    local down = love.mouse.isDown(1)
    --updates mouse tracking
    mousePos.x = love.mouse.getX()
    mousePos.y = love.mouse.getY()
    --updates the animation, not actually necessary for this scene because it will be just 1 frame at a time
    startMenu.animations.grow:update((dt*0.5))
    -- tracks if the mouse is positioned over the Start button
    StartBox = NewBoxTracker(150, 350, 550, 620)
    SettingsBox = NewBoxTracker(150, 350, 650, 720)
    if StartBox == 1 then
        startMenu.gridX = 2
        -- switches to glitchy animation if the mouse is down
        if down then
            startMenu.gridX = 4
            startClock:update(10*dt)
        end
-- tracks if the mouse is positioned over the Setting button
    elseif SettingsBox == 1 then
            startMenu.gridX = 3
        -- switches to glitchy animation if the mouse is down
        if down then
            startMenu.gridX = 5
            settingsClock:update(10*dt)
        end

    else
    --makes sure the animation is reset to the first frame if the mouse is not over the buttons
   startMenu.gridX = 1
    end
    -- resets the clocks if the mouse is not down, so that the scene does not change
    -- this is necessary because the clocks will not reset if the mouse is not down
    -- DO NOT DELETE THIS
    if not down then
        settingsClock:reset()
        startClock:reset()
    end
    -- necessary. I don't know why but don't delete it, it's the only way we got it to work
    startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)
end
function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
    
end

return game
