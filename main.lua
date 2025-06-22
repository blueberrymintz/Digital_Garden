SceneryInit = require("libraries/scenery_main/scenerys")

Scenery = SceneryInit(
    { path = "scenes/example"; key = "example"},
    { path = "scenes/startMenu"; key = "startMenu"},
    { path = "scenes/homeGarden"; key = "garden"},
    {path = "scenes/settingsMenu"; key = "settings"},
    {path = "scenes/sink"; key = "sink"},
    {path = "scenes/pauseMenu"; key = "pauseMenu"},
    {path = "scenes/startMenu2"; key = "startMenuAlt"; default = true}
)
Main = {}
anim8 = require 'libraries/anim8-master/anim8'
think = require 'thinker'
settings = require 'settings'
DevelopmentMode = false
cron = require 'libraries/cronLua_Master/cron'

GTick = {}
GTick.track = 1
GTick.total = 0

InitializeGame(1, Settings.debugMode)
local function pauseClockFunction()

end
Screen = {}
    Screen.width, Screen.height = love.window.getMode()
    Screen.centerX = Screen.width / 2
    Screen.centerY = Screen.height / 2
    Screen.resizeValue = Screen.height / Screen.width
local pauseMenuClock = cron.after(0.1, pauseClockFunction)
function love.load()
    LastScene = nil
    Scenery:load()
    GlobalCurrentScene = nil

    print("SW" .. Screen.width .. " SH" .. Screen.height .. " CenterX" .. Screen.centerX .. " CenterY" .. Screen.centerY)
    print("resizeValue: " .. Screen.resizeValue)
end
function love.resize(w, h)

    Scenery:resize(w, h)
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
    pauseMenuClock:reset(dt)
end

function love.draw()
    Scenery:draw()
end