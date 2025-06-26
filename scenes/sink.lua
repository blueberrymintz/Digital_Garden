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

    --prints to terminal
function game:load()
    print("Warp Successful! Current Scene: Sink (Placeholder)")
    GlobalCurrentScene = "Sink"
    Sink = {}
    SinkKnob = {}
    Mug = {}
    -- initializes the Sink sprites and animations
    Sink.sprite = love.graphics.newImage('sprites/newSink/sinkSheet.png')
    Sink.grid = anim8.newGrid(Sink.sprite:getWidth()/2, Sink.sprite:getHeight(), Sink.sprite:getWidth(), Sink.sprite:getHeight())
    Sink.animations = {}
    Sink.animations.background = anim8.newAnimation(Sink.grid(1, 1), 0.1)
    Sink.animations.background:gotoFrame(1, 1)
    Sink.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    Sink.position = {x = Screen.centerX, y = Screen.centerY}
    Sink.offset = {x = (Sink.sprite:getWidth()/2), y = Sink.sprite:getHeight()}
    Sink.isOn = false
    Sink.tick = false


    SinkKnob.sprite = love.graphics.newImage('sprites/newSink/sinkKnobSheet.png')
    SinkKnob.grid = anim8.newGrid(SinkKnob.sprite:getWidth()/4, SinkKnob.sprite:getHeight(), SinkKnob.sprite:getWidth(), SinkKnob.sprite:getHeight())
    SinkKnob.animations = {}
    SinkKnob.animations.knob = anim8.newAnimation(SinkKnob.grid('1-4', 1), 0.1)
    SinkKnob.animations.knob:gotoFrame(1, 1)
    SinkKnob.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    SinkKnob.position = {x = Screen.centerX , y = Screen.centerY }
    SinkKnob.offset = {x = (SinkKnob.sprite:getWidth()/4), y = SinkKnob.sprite:getHeight()}

    Mug.sprite = love.graphics.newImage('sprites/newSink/mug.png')
    Mug.grid = anim8.newGrid(Mug.sprite:getWidth(), Mug.sprite:getHeight(), Mug.sprite:getWidth(), Mug.sprite:getHeight())
    Mug.animations = {}
    Mug.animations.mug = anim8.newAnimation(Mug.grid(1, 1), 0.1)
    Mug.animations.mug:gotoFrame(1, 1)
    Mug.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    Mug.position = {x = Screen.centerX, y = Screen.centerY}
    Mug.offset = {x = (Mug.sprite:getWidth()*Mug.resizeValue)*0.75, y = (Mug.sprite:getHeight()*Mug.resizeValue)*0.75}
    Mug.isFull = false

    local function sinkRunner(string)
    if string == 'flip' then
        if Sink.isOn == true then
            Sink.isOn = false
        else
            Sink.isOn = true
        end
        Sink.tick = false
        print('SinkClock: "DING"')
    end
end
SinkClock = cron.after(1, sinkRunner, 'flip')

end

function game:keypressed(key, scancode, isrepeat)

    if key == 'escape' then
        csetScene('startMenuAlt')
    end
    if key == 's' then
        Sink.tick = true
    end
    if key == 'p' then
        print("Mug Fullness: " .. Mug.isFull)
    end
end

function game:mousepressed(mouseX, mouseY, button)
    if button == 1 then
        Sink.tick = true
    end
    if button then 
        Mug.position.x = mouseX
        Mug.position.y = mouseY
    end
end 


function game:mousereleased(mouseX, mouseY, button)
    if button == 1 then
        Sink.isOn = false
        SinkClock:reset()
    end
end


function game:update(dt)
    if Sink.tick == true then
        SinkClock:update(dt)
    end
    if Sink.tick == false then
        SinkClock:reset()
    end
    if Sink.isOn == true then
        Mug.isFull = true
    end
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    -- draw the Sink background
    Sink.animations.background:draw(Sink.sprite, Sink.position.x, Sink.position.y, 0, Sink.resizeValue, Sink.resizeValue, Sink.offset.x, Sink.offset.y)
    -- draw the Sink knob
    SinkKnob.animations.knob:draw(SinkKnob.sprite, SinkKnob.position.x, SinkKnob.position.y, 0, SinkKnob.resizeValue, SinkKnob.resizeValue, SinkKnob.offset.x, SinkKnob.offset.y)
    -- draw the Mug
    Mug.animations.mug:draw(Mug.sprite, Mug.position.x, Mug.position.y, 0, Mug.resizeValue, Mug.resizeValue, Mug.offset.x, Mug.offset.y)
end


return game