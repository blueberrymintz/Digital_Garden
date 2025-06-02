local game = {}
-- cron library, for clocks
local cron = require('libraries/cronLua_Master/cron')
-- mouse positioning tracker
local mousePos = {}
local boxTracker = require('tracker/boxTracker')
local function csetScene(foo)
    game.setScene(foo)
end

function game:load()
    --prints to terminal
    print("Warp Successful! Current Scene: Sink (Placeholder)")
end

function game:update(dt)
    
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
end

return game