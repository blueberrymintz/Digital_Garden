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

    print("Warp Successful! Current Scene: Sink (Placeholder)")
    GlobalCurrentScene = "Sink"
    Sink = {}
    SinkKnob = {}
    -- initializes the Sink sprites and animations
    Sink.sprite = love.graphics.newImage('sprites/newSink/sinkSheet.png')
    Sink.grid = anim8.newGrid(Sink.sprite:getWidth()/2, Sink.sprite:getHeight(), Sink.sprite:getWidth(), Sink.sprite:getHeight())
    Sink.animations = {}
    Sink.animations.background = anim8.newAnimation(Sink.grid(1, 1), 0.1)
    Sink.animations.background:gotoFrame(1, 1)
    Sink.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    Sink.position = {x = Screen.centerX * Sink.resizeValue, y = Screen.centerY * Screen.resizeValue}

    SinkKnob.sprite = love.graphics.newImage('sprites/newSink/sinkKnobSheet.png')
    SinkKnob.grid = anim8.newGrid(SinkKnob.sprite:getWidth()/4, SinkKnob.sprite:getHeight(), SinkKnob.sprite:getWidth(), SinkKnob.sprite:getHeight())
    SinkKnob.animations = {}
    SinkKnob.animations.knob = anim8.newAnimation(SinkKnob.grid('1-4', 1), 0.1)
    SinkKnob.animations.knob:gotoFrame(1, 1)
    SinkKnob.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    SinkKnob.position = {x = Screen.centerX , y = Screen.centerY }

end

function game:keypressed(key, scancode, isrepeat)
    keyTracker:keypressed(key, scancode, isrepeat)
    if key == 'escape' then
        csetScene('startMenuAlt')
    end
end

function game:mousepressed(mouseX, mouseY, button)
    

end 


function game:mousereleased(mouseX, mouseY, button)


end


function game:update(dt)
    
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    -- draw the Sink background
    Sink.animations.background:draw(Sink.sprite, Sink.position.x, Sink.position.y, 0, Sink.resizeValue, Sink.resizeValue, Sink.sprite:getWidth()/2, Sink.sprite:getHeight())
    -- draw the Sink knob
    SinkKnob.animations.knob:draw(SinkKnob.sprite, SinkKnob.position.x, SinkKnob.position.y, 0, SinkKnob.resizeValue, SinkKnob.resizeValue, SinkKnob.sprite:getWidth()/4, SinkKnob.sprite:getHeight())
end

return game