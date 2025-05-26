local SceneryInit = require("libraries/scenery_main/scenerys")
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


function love.load()
    scenery:load()
end

function love.update(dt)
    scenery:update()
end

function love.draw()
    scenery:draw()
end