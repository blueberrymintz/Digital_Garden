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

function love.load(dt)
    MousePos.x = 0
    MousePos.y = 0
    Scenery:load()
end

function love.update(dt)
    Scenery:update(dt)
    MousePos.x = love.mouse.getX()
    MousePos.y = love.mouse.getY()
    function love.mousepressed(x, y, button)
    if button == 1 then MouseDown = 2 else MouseDown = 1 end
    end
    if MouseDown > 1 then 
        MouseDown = MouseDown - (0.2*dt)
    end


end

function love.draw()
    Scenery:draw()
end
