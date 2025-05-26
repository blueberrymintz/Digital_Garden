local SceneryInit = require("libraries/scenery_main/scenerys")
Gdt = 0
local scenery = SceneryInit(
    { path = "scenes/example"; key = "example"},
    { path = "scenes/startMenu"; key = "startMenu"},
    { path = "scenes/homeGarden"; key = "garden"; default = "true"}
)
anim8 = require 'libraries.anim8'
think = require 'thinker'
set = require 'settings'
input = require 'tracker.keyInput'
cron = require 'libraries/cronLua_Master/cron'
player = require 'player'
GTick = {}
GTick.track = 1
GTick.total = 0

function love.load()
    scenery:load()
end

function love.update(dt)
    scenery:update(dt)
    GTick.track = GTick.track + dt
    if GTick.track > 2 then
        GTick.track = 1
        GTick.total = GTick.total + 1
    end
end

function love.draw()
    scenery:draw()
end