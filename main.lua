SceneryInit = require("libraries/scenery_main/scenerys")

Scenery = SceneryInit(
    {path = "scenes/example"; key = "example"},
    {path = "scenes/homeGarden"; key = "garden"},
    {path = "scenes/settingsMenu"; key = "settings"},
    {path = "scenes/sink"; key = "sink"},
    {path = "scenes/pauseMenu"; key = "pauseMenu"},
    {path = "scenes/startMenu"; key = "startMenuAlt"},
    {path = "scenes/fixer"; key = 'fixer'},
    {path = "scenes/elevator"; key = 'elevator'},
    {path = "scenes/startMenuRewrite"; key = "startMenuRewrite"; default = true},
    {path = "scenes/settingsMenuRewrite"; key = "settingsMenuRewrite"}
)
Main = {}
local anim8 = require 'libraries/anim8-master/anim8'
local settings = require 'settings'
DevelopmentMode = true
cron = require 'libraries/cronLua_Master/cron'

GTick = {}
GTick.track = 1
GTick.total = 0
FIRSTSTART = true
InitializeGame(1, Settings.debugMode)
local function pauseClockFunction()

end

        love.window.setMode(402, 874, {vsync=0, minwidth=270, minheight= 630})
Screen = {}
    Screen.width, Screen.height = love.window.getMode()
    Screen.centerX = Screen.width / 2
    Screen.centerY = Screen.height / 2
    Screen.resizeValue = {w = 402/Screen.width, h = 874/Screen.height}
local pauseMenuClock = cron.after(0.1, pauseClockFunction)
function love.load()
    LastScene = nil
    Scenery:load()
    GlobalCurrentScene = nil
    print("SW" .. Screen.width .. " SH" .. Screen.height .. " CenterX" .. Screen.centerX .. " CenterY" .. Screen.centerY)
    print("resizeValue W:" .. Screen.resizeValue.w .. " H: " .. Screen.resizeValue.h)
    OS_String = love.system.getOS()
    print("OS: " .. OS_String)
end
function love.resize(w, h)
    Scenery:resize(w, h)
    Screen.width, Screen.height = w, h
    Screen.centerX = Screen.width / 2
    Screen.centerY = Screen.height / 2
    Screen.resizeValue = {w = 402/Screen.width, h = 874/Screen.height}
    print("Resize Event: SW" .. Screen.width .. " SH" .. Screen.height .. " CenterX" .. Screen.centerX .. " CenterY" .. Screen.centerY)
end
function love.keypressed(key, scancode, isrepeat)
    Scenery:keypressed(key, scancode, isrepeat)
    if key == 'p' then
        print("OS_String: " .. OS_String)
        print("Screen.width:" .. Screen.width)
        print("Screen.height:" .. Screen.height)
        print("Screen.centerX:" .. Screen.centerX)
        print("Screen.centerY:" .. Screen.centerY)
        print("Screen.resizeValue W:" .. Screen.resizeValue.w .. " H:" .. Screen.resizeValue.h)
        print("MouseX:" .. love.mouse.getX() .. " MouseY:" .. love.mouse.getY())
    end
end
function love.mousepressed(mouseX, mouseY, button)
    Scenery:mousepressed(mouseX, mouseY, button)
    if DevelopmentMode == true then
        if button then
            print('Mouse X:' .. mouseX .. '  Mouse Y:' .. mouseY .. '  Button:' .. button)
        end
    end
end
function love.mousereleased(mouseX, mouseY, button)
    Scenery:mousereleased(mouseX, mouseY, button)
    if DevelopmentMode == true then
        if button then 
            print('Mouse Released X:' .. mouseX .. '  Mouse Released Y:' .. mouseY .. '  Button:' .. button)
        end
    end
end
function love.update(dt)
    Scenery:update(dt)
    pauseMenuClock:reset(dt)
end

function love.draw()
    Scenery:draw()
end