SceneryInit = require("libraries/scenery_main/scenerys")

Scenery = SceneryInit(
    { path = "scenes/example"; key = "example"},
    { path = "scenes/startMenu"; key = "startMenu"; default = "true"},
    { path = "scenes/homeGarden"; key = "garden"},
    {path = "scenes/settingsMenu"; key = "settings"},
    {path = "scenes/sink"; key = "sink"},
    {path = "scenes/pauseMenu"; key = "pauseMenu"}
)
Main = {}
anim8 = require 'libraries/anim8-master/anim8'
think = require 'thinker'
settings = require 'settings'

cron = require 'libraries/cronLua_Master/cron'

GTick = {}
GTick.track = 1
GTick.total = 0
InitializeGame(1, Settings.debugMode)
MousePos = {}
MouseDown = 1
WindowSize = {}
CallPause = nil
local function pauseClockFunction()

end
local pauseMenuClock = cron.after(0.1, pauseClockFunction)
function love.load()
    LastScene = nil
    MousePos.x = 0
    MousePos.y = 0
    Scenery:load()
    GlobalCurrentScene = nil
end
function love.keypressed(key, scancode, isrepeat)
    Scenery:keypressed(key, scancode, isrepeat)
end
function love.mousepressed(mouseX, mouseY, button)
    Scenery:mousepressed(mouseX, mouseY, button)
end
function love.mousereleased(mouseX, mouseY, button)
    Scenery:mousereleased(mouseX, mouseY, button)
end
function love.update(dt)
    Scenery:update(dt)
    MousePos.x = love.mouse.getX()
    MousePos.y = love.mouse.getY()
    WindowSize.width, WindowSize.height = love.graphics.getDimensions()
    pauseMenuClock:reset(dt)
end

function love.draw()
    Scenery:draw()
end