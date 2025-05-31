SceneryInit = require("libraries/scenery_main/scenerys")

Scenery = SceneryInit(
    { path = "scenes/example"; key = "example"},
    { path = "scenes/startMenu"; key = "startMenu"; default = "true"},
    { path = "scenes/homeGarden"; key = "garden"},
    {path = "scenes/settingsMenu"; key = "settings"}
)
anim8 = require 'libraries.anim8'
think = require 'thinker'
settings = require 'settings'

Cron = require 'libraries/cronLua_Master/cron'
player = require 'player'
GTick = {}
GTick.track = 1
GTick.total = 0
InitializeGame(1, Settings.debugMode)
MousePos = {}
MouseDown = 1
WindowSize = {}
function love.load(dt)
    MousePos.x = 0
    MousePos.y = 0
    Scenery:load()

end

function love.update(dt)
    Scenery:update(dt)
    MousePos.x = love.mouse.getX()
    MousePos.y = love.mouse.getY()
    WindowSize.width, WindowSize.height = love.graphics.getDimensions()

end

function love.draw()
    Scenery:draw()
end
