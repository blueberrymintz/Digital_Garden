local game = {}
-- cron library, for clocks
local cron = require('libraries/cronLua_Master/cron')
local keys = require('tracker/keyTracker')

local boxTracker = require('tracker/boxTracker')

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
    --prints to terminal
    print("Warp Successful! Current Scene: Start Menu")
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

function game:mousepressed(mouseX, mouseY, button)
    -- callback for mouse over start button
    if BoxTracker2(150,550,200,80,mouseX,mouseY) == 1 then
        print("START")
    end
    -- callback for mouse over settings button
    if BoxTracker2(150,650,200,80,mouseX,mouseY) == 1 then
        print("SETTINGS")
    end
    -- returns mouse X and Y in terminal for diagnosing problems
    if button then
        print('Mouse X:' .. mouseX .. '  Mouse Y:' .. mouseY .. '  Button:' .. button)
    end
end

function game:mousereleased(mouseX, mouseY, button)

end

function game:keypressed(key, scancode, isrepeat)
    if key == 's' then
        startClock:update(1)
    end
    if key =='t' then
        settingsClock:update(1)
    end
end
function game:update(dt)
    --plays the song
    if MusicKey == 1 then
    song:play()
    end
    -- DO NOT DELETE THIS
    settingsClock:reset()
    startClock:reset()
    -- necessary. I don't know why but don't delete it, it's the only way we got it to work
    startMenu.animations.grow:update(dt)
end

function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
    
end

return game
