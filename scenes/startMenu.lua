local game = {}
-- cron library, for clocks
local cron = require('libraries/cronLua_Master/cron')
local keys = require('tracker/keyTracker')
local boxTracker = require('tracker/boxTracker')
local anim8 = require 'libraries/anim8-master/anim8'
-- gets the transition to garden scene
-- DO NOT DELETE THIS
local function csetScene(foo)
    LastScene = GlobalCurrentScene
    game.setScene(foo)
end
local clockCallStart = 1
local clockCallSettings = 1
-- starts the clocks for the start menu and settings menu
-- DO NOT DELETE THESE
local startClock = cron.after(1, csetScene, 'garden')
local settingsClock = cron.after(1, csetScene, 'settings')
function game:load()
    GlobalCurrentScene = "pauseMenu"
    --prints to terminal
    print("Warp Successful! Current Scene: Start Menu")
        startMenu = {}
        -- initializes the start menu sprites and animations
        -- DO NOT DELETE THIS
startMenu.sprite = love.graphics.newImage('sprites/scuffed_menu/JJmenu/sprite_sheet.png')
startMenu.grid = anim8.newGrid((startMenu.sprite:getWidth()/5), startMenu.sprite:getHeight(), startMenu.sprite:getWidth(), startMenu.sprite:getHeight())
startMenu.animations = {}
startMenu.animations.grow = anim8.newAnimation(startMenu.grid( '1-5', 1), 0.1)
-- loads song for start menu
song = love.audio.newSource('sounds/organLaughing2.ogg', 'stream')
-- sets song to loop
song:setLooping(true)
song:setVolume(2)
startMenu.animations.grow:gotoFrame( 1, 1)
clockCallSettings = 1
clockCallStart = 1
end

function game:mousepressed(mouseX, mouseY, button)
    -- callback for mouse over start button
    if BoxTracker2(150,550,200,80,mouseX,mouseY) == 1 then
        print("START")
        clockCallStart = 2
    end
    -- callback for mouse over settings button
    if BoxTracker2(150,650,200,80,mouseX,mouseY) == 1 then
        print("SETTINGS")
        clockCallSettings = 2
    end
    -- returns mouse X and Y in terminal for diagnosing problems
    if button then
        print('Mouse X:' .. mouseX .. '  Mouse Y:' .. mouseY .. '  Button:' .. button)
    end
end

function game:mousereleased(mouseX, mouseY, button)
    clockCallSettings = 1
    clockCallStart = 1
    print('released')
end

function game:keypressed(key, scancode, isrepeat)
    if key == 's' then
        startClock:update(10)
    end
    if key =='t' then
        settingsClock:update(10)
    end
    if key == 'a' then
        csetScene('startMenuAlt')
    end
end

function game:update(dt)
    --plays the song
    if MusicKey == 1 then
    song:play()
    elseif MusicKey == 2 then
        love.audio.stop()
    end

    -- necessary. I don't know why but don't delete it, it's the only way we got it to work
    if clockCallStart == 2 then
        startClock:update(6*dt)
        startMenu.animations.grow:gotoFrame( 4, 1)

    else
        startClock:reset()
    end
    if clockCallSettings == 2 then
        settingsClock:update(6*dt)
        startMenu.animations.grow:gotoFrame( 5, 1)

    else
        settingsClock:reset()
    end
    if clockCallStart == 1 and clockCallSettings == 1 then
        startMenu.animations.grow:gotoFrame( 1, 1)
    end

end
function game:draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, 0, 0.5)
    
end

return game
