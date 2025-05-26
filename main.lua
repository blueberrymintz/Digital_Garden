SceneryInit = require("libraries/scenery_main/scenerys")
Gdt = 0
Scenery = SceneryInit(
    { path = "scenes/example"; key = "example"},
    { path = "scenes/startMenu"; key = "startMenu"; default = "true"},
    { path = "scenes/homeGarden"; key = "garden"}
)
anim8 = require 'libraries.anim8'
think = require 'thinker'
set = require 'settings'
input = require 'tracker.keyInput'
Cron = require 'libraries/cronLua_Master/cron'
player = require 'player'
GTick = {}
GTick.track = 1
GTick.total = 0
InitializeGame(1,2)
MousePos = {}
MouseDown = 1
local function resetMouseDown()
    MouseDown = 1
end
function love.load()
    MousePos.x = 0
    MousePos.y = 0
    Scenery:load()
end

function love.update(dt)
    Scenery:update(dt)
    GTick.track = GTick.track + dt
    if GTick.track > 2 then
        GTick.track = 1
        GTick.total = GTick.total + 1
    end
    MousePos.x = love.mouse.getX()
    MousePos.y = love.mouse.getY()
    function love.mousepressed(x, y, button)
    if button == 1 then
        MouseDown = 2
    end
    if MouseDown == 2 then
        Cron.after(1, resetMouseDown)
    end
end
end

function love.draw()
    Scenery:draw()
end