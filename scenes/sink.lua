local game = {}
-- cron library, for clocks
local cron = require('libraries/cronLua_Master/cron')
-- mouse positioning tracker
local mousePos = {}
local keyTracker = require('tracker/keyTracker')
local boxTracker = require('tracker/boxTracker')
local function csetScene(foo)
    LastScene = GlobalCurrentScene
    game.setScene(foo)
end

function game:load()
    --prints to terminal
    if OS_String == 'iOS' then
        OSresizeValue = 1
    end
    if OS_String == 'OS X' or 'Linux' then
        OSresizeValue = 0.1
    end
    print("Warp Successful! Current Scene: Sink (Placeholder)")
    GlobalCurrentScene = "sink"
    sink = {}
    local sinkKnob = {}
    sink.sprite = love.graphics.newImage('sprites/sink/sink.png')
    sink.grid = anim8.newGrid(sink.sprite:getWidth(), sink.sprite:getHeight(), sink.sprite:getWidth(), sink.sprite:getHeight())
    sink.animations = {}
    sink.animations.background = anim8.newAnimation(sink.grid(1, 1), 0.1)
    sink.animations.background:gotoFrame(1, 1)
    sink.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    sink.position = {x = Screen.centerX, y = Screen.centerY}

    sinkKnob.sprite = love.graphics.newImage('sprites/sink/sinkKnobSheet.png')
    sinkKnob.grid = anim8.newGrid(sinkKnob.sprite:getWidth()/2, sinkKnob.sprite:getHeight()/2, sinkKnob.sprite:getWidth(), sinkKnob.sprite:getHeight())
    sinkKnob.animations = {}
    sinkKnob.animations.knob = anim8.newAnimation(sinkKnob.grid('1-2', '1-2'), 0.1)
    sinkKnob.animations.knob:gotoFrame(1, 1)
    sinkKnob.position = {x = 0, y = 0}
end

function game:update(dt)
    
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    -- draw the sink background
    sink.animations.background:draw(sink.sprite, sink.position.x, sink.position.y, 0, sink.resizeValue, sink.resizeValue, sink.sprite:getWidth()/2, sink.sprite:getHeight()/2)
    -- draw the sink knob
end

return game