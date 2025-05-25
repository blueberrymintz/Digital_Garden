local SceneryInit = require("libraries/scenery_main/scenerys")
local scenery = SceneryInit(...)
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
local clock = cron.after(1, InitializeGame, ScreenType[1], ScreenType[2])
end

function love.draw()
    scenery:draw()
end