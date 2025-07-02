local anim8 = require ("libraries/anim8-master/anim8")
local cron = require ("libraries/cronLua_Master/cron")
local boxes = require ("tracker/boxTracker")


local game = {}

local function csetScene(scene)
    LastScene = GlobalCurrentScene
    game.setScene(scene)
end

local sprites = {}
local buttons = {}


function game:load()
    


    -- global navigation buttons
        buttons.settings = {}
        buttons.home = {}
        buttons.portals = {}
        buttons.settings.image = love.graphics.newImage('sprites/symbols/gearSymbol.png')
        buttons.settings.pos = {
        x = 50,
        y = 600
    }
        buttons.settings.resize = {w = Screen.resizeValue.w * 1, h = Screen.resizeValue.h * 1}
        buttons.settings.grid = anim8.newGrid(buttons.settings.image:getWidth(), buttons.settings.image:getHeight(), buttons.settings.image:getWidth(), buttons.settings.image:getHeight())
        buttons.settings.animation = anim8.newAnimation(buttons.settings.grid(1, 1), 0.1)
        buttons.settings.trueWidth = buttons.settings.image:getWidth() * buttons.settings.resize.w
        buttons.settings.trueHeight = buttons.settings.image:getHeight() * buttons.settings.resize.h

        buttons.home.image = love.graphics.newImage('sprites/symbols/homeSymbol.png')
        buttons.home.pos = {
        x = 150,
        y = 700
    }
        buttons.home.resize = {w = Screen.resizeValue.w * 1, h = Screen.resizeValue.h * 1}
        buttons.home.grid = anim8.newGrid(buttons.home.image:getWidth(), buttons.home.image:getHeight(), buttons.home.image:getWidth(), buttons.home.image:getHeight())
        buttons.home.animation = anim8.newAnimation(buttons.home.grid(1, 1), 0.1)
        buttons.home.trueWidth = buttons.home.image:getWidth() * buttons.home.resize.w
        buttons.home.trueHeight = buttons.home.image:getHeight() * buttons.home.resize.h

        buttons.portals.image = love.graphics.newImage('sprites/symbols/9circlesSymbol.png')
        buttons.portals.pos = {
        x = 250,
        y = 600
    }
        buttons.portals.resize = {w = Screen.resizeValue.w * 1, h = Screen.resizeValue.h * 1}
        buttons.portals.grid = anim8.newGrid(buttons.portals.image:getWidth(), buttons.portals.image:getHeight(), buttons.portals.image:getWidth(), buttons.portals.image:getHeight())
        buttons.portals.animation = anim8.newAnimation(buttons.portals.grid(1, 1), 0.1)
        buttons.portals.trueWidth = buttons.portals.image:getWidth() * buttons.portals.resize.w
        buttons.portals.trueHeight = buttons.portals.image:getHeight() * buttons.portals.resize.h

end

function game:keypressed(key, scancode, isrepeat)


end

function game:mousepressed(mouseX, mouseY, button)

    local settingsBox = BoxTracker2(buttons.settings.pos.x, buttons.settings.pos.y, buttons.settings.trueWidth, buttons.settings.trueHeight, mouseX, mouseY)
    local homeBox = BoxTracker2(buttons.home.pos.x, buttons.home.pos.y, buttons.home.trueWidth, buttons.home.trueHeight, mouseX, mouseY)
    local portalsBox = BoxTracker2(buttons.portals.pos.x, buttons.portals.pos.y, buttons.portals.trueWidth, buttons.portals.trueHeight, mouseX, mouseY)
    if button and settingsBox == 1 then
        print("settingsBox clicked")
    end
    if button and homeBox == 1 then 
        print("homeBox clicked")
    end
    if button and portalsBox == 1 then
        print("portalsBox clicked")
    end
end

function game:mousereleased(mouseX, mouseY, button)

    -- global navigation buttons
    local settingsBox = BoxTracker2(buttons.settings.pos.x, buttons.settings.pos.y, buttons.settings.trueWidth, buttons.settings.trueHeight, mouseX, mouseY)
    local homeBox = BoxTracker2(buttons.home.pos.x, buttons.home.pos.y, buttons.home.trueWidth, buttons.home.trueHeight, mouseX, mouseY)
    local portalsBox = BoxTracker2(buttons.portals.pos.x, buttons.portals.pos.y, buttons.portals.trueWidth, buttons.portals.trueHeight, mouseX, mouseY)
    if button and settingsBox == 1 then
        print("settingsBox released")
        csetScene("settingsMenuRewrite")
    end
    if button and homeBox == 1 then
        print("homeBox released")
        csetScene("homeGardenRewrite")
    end
    if button and portalsBox == 1 then
        print("portalsBox released")
        csetScene("icons")
    end
end

function game:update(dt)
    
end

function game:draw()
        
    
    -- global navigation button
    buttons.settings.animation:draw(buttons.settings.image, buttons.settings.pos.x, buttons.settings.pos.y, 0, buttons.settings.resize.w, buttons.settings.resize.h)
        buttons.home.animation:draw(buttons.home.image, buttons.home.pos.x, buttons.home.pos.y, 0, buttons.home.resize.w, buttons.home.resize.h)
            buttons.portals.animation:draw(buttons.portals.image, buttons.portals.pos.x, buttons.portals.pos.y, 0, buttons.portals.resize.w, buttons.portals.resize.h)

end

return game