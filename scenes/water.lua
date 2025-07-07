local anim8 = require ("libraries/anim8-master/anim8")
local cron = require ("libraries/cronLua_Master/cron")
local boxes = require ("tracker/boxTracker")
local objTracker = require("tracker/objTracker")

local game = {}

local function csetScene(scene)
    LastScene = GlobalCurrentScene
    game.setScene(scene)
end

local sprites = {}
local buttons = {}

local grace = true
local function graceSwitcher()
    if grace == false then grace = true else grace = false end
end
local graceTimer = cron.after(0.5, graceSwitcher)



function game:load()
    

-- background image
sprites.background = {}
    sprites.background.image = love.graphics.newImage('sprites/homeGardenRewrite/plantsBackgroundSprite.png')
    sprites.background.pos = {x = 0 * Screen.resizeValue.w, y = 0 * Screen.resizeValue.h}
    sprites.background.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.background.grid = anim8.newGrid(sprites.background.image:getWidth(), sprites.background.image:getHeight(), sprites.background.image:getWidth(), sprites.background.image:getHeight())
    sprites.background.animation = anim8.newAnimation(sprites.background.grid(1, 1), 0.1)
    sprites.background.trueWidth = sprites.background.image:getWidth() * sprites.background.resize.w
    sprites.background.trueHeight = sprites.background.image:getHeight() * sprites.background.resize.h

    -- watering can image
    sprites.water = {}
    sprites.water.image = love.graphics.newImage("sprites/wateringScene/waterCanSheet.png")
    sprites.water.pos = {
        x = 50,
        y = 400
    }
    sprites.water.resize = {
        w = Screen.resizeValue.w * 0.75,
        h = Screen.resizeValue.h * 0.75
    }
    sprites.water.grid = anim8.newGrid(sprites.water.image:getWidth()/2, sprites.water.image:getHeight(), sprites.water.image:getWidth(), sprites.water.image:getHeight())
    sprites.water.animation = anim8.newAnimation(sprites.water.grid("1-2", 1), 1)
    sprites.water.trueWidth = (sprites.water.image:getWidth()/2) * sprites.water.resize.w
    sprites.water.trueHeight = sprites.water.image:getHeight() * sprites.water.resize.h
    sprites.water.offset = {
        x = 0,
        y = 0
    }
    sprites.water.holdPos = {
        x = 0,
        y = 0
    }

    sprites.sink = {}
    sprites.sink.image = love.graphics.newImage("sprites/wateringScene/waterCooler.png")
    sprites.sink.pos = {
        x = 120,
        y = 170
    }
    sprites.sink.resize = {
        w = Screen.resizeValue.w * 1.25,
        h = Screen.resizeValue.h * 1.25
    }
    sprites.sink.grid = anim8.newGrid(sprites.sink.image:getWidth(), sprites.sink.image:getHeight(), sprites.sink.image:getWidth(), sprites.sink.image:getHeight())
    sprites.sink.animation = anim8.newAnimation(sprites.sink.grid(1, 1), 1)
    sprites.sink.trueWidth = sprites.sink.image:getWidth() * sprites.sink.resize.w
    sprites.sink.trueHeight = sprites.sink.image:getHeight() * sprites.sink.resize.h



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
    if key == "b" then
        TapObject("waterCan")
    end
    if key == "n" then
        DropObject("waterCan")
    end
    if key == "v" then
        local heldObject = CallHeldObject()
        print(tostring(heldObject))
    end

end

function game:mousepressed(mouseX, mouseY, button)
    local sinkBox = BoxTracker(sprites.sink.pos.x, sprites.sink.pos.y, sprites.sink.trueWidth, sprites.sink.trueHeight, mouseX, mouseY)
    local waterCanBox = BoxTracker(sprites.water.pos.x, sprites.water.pos.y, sprites.water.trueWidth, sprites.water.trueHeight, mouseX, mouseY)
    
    if button and sinkBox == 1 then
        print("sink clicked")
    end
    if button and waterCanBox == 1 then
        print("water can clicked")
        if CallHeldObject() == "waterCan" then
            DropObject("waterCan")
        else
            TapObject("waterCan")
            sprites.water.holdPos.x = mouseX - sprites.water.pos.x
            sprites.water.holdPos.y = mouseY - sprites.water.pos.y
        end
    end
    -- global navigation buttons
    local settingsBox = BoxTracker(buttons.settings.pos.x, buttons.settings.pos.y, buttons.settings.trueWidth, buttons.settings.trueHeight, mouseX, mouseY)
    local homeBox = BoxTracker(buttons.home.pos.x, buttons.home.pos.y, buttons.home.trueWidth, buttons.home.trueHeight, mouseX, mouseY)
    local portalsBox = BoxTracker(buttons.portals.pos.x, buttons.portals.pos.y, buttons.portals.trueWidth, buttons.portals.trueHeight, mouseX, mouseY)
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
    local sinkBox = BoxTracker(sprites.sink.pos.x, sprites.sink.pos.y, sprites.sink.trueWidth, sprites.sink.trueHeight, mouseX, mouseY)
    local waterCanBox = BoxTracker(sprites.water.pos.x, sprites.water.pos.y, sprites.water.trueWidth, sprites.water.trueHeight, mouseX, mouseY)
    
    if button and sinkBox == 1 then
        print("sink released")
    end
    if button and waterCanBox == 1 then
        print("water can released")

    end
    -- global navigation buttons
    local settingsBox = BoxTracker(buttons.settings.pos.x, buttons.settings.pos.y, buttons.settings.trueWidth, buttons.settings.trueHeight, mouseX, mouseY)
    local homeBox = BoxTracker(buttons.home.pos.x, buttons.home.pos.y, buttons.home.trueWidth, buttons.home.trueHeight, mouseX, mouseY)
    local portalsBox = BoxTracker(buttons.portals.pos.x, buttons.portals.pos.y, buttons.portals.trueWidth, buttons.portals.trueHeight, mouseX, mouseY)
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

function game:mousemoved(mouseX, mouseY)    
    local boundsBox = BoxTracker(15 * Screen.resizeValue.w, 170 * Screen.resizeValue.h, 380 * Screen.resizeValue.w, 360 * Screen.resizeValue.h, mouseX, mouseY)
    if boundsBox == 2 then
        
    end
    
end


function game:update(dt)
    if WaterCan.isHeld then

        sprites.water.pos.x = love.mouse.getX() - sprites.water.holdPos.x
        sprites.water.pos.y = love.mouse.getY() - sprites.water.holdPos.y

    end
    local boundsBox2 = ColliderTracker("container", 15, 170, 380, 360, sprites.water.pos.x, sprites.water.pos.y, sprites.water.trueWidth, sprites.water.trueHeight)
    local boundsBox3 = ColliderTracker("container", 5, 160, 370, 350, sprites.water.pos.x, sprites.water.pos.y, sprites.water.trueWidth, sprites.water.trueHeight)
    
    if boundsBox2 == 2 then
        if CallHeldObject() == "waterCan" then
            DropObject("waterCan")
        end
    end

end
function game:draw()
    sprites.background.animation:draw(sprites.background.image, sprites.background.pos.x, sprites.background.pos.y, 0, sprites.background.resize.w, sprites.background.resize.h)
    
    sprites.sink.animation:draw(sprites.sink.image, sprites.sink.pos.x, sprites.sink.pos.y, 0, sprites.sink.resize.w, sprites.sink.resize.h)
    sprites.water.animation:draw(sprites.water.image, sprites.water.pos.x, sprites.water.pos.y, 0, sprites.water.resize.w, sprites.water.resize.h, sprites.water.offset.x, sprites.water.offset.y)
-- global navigation button
    buttons.settings.animation:draw(buttons.settings.image, buttons.settings.pos.x, buttons.settings.pos.y, 0, buttons.settings.resize.w, buttons.settings.resize.h)
        buttons.home.animation:draw(buttons.home.image, buttons.home.pos.x, buttons.home.pos.y, 0, buttons.home.resize.w, buttons.home.resize.h)
            buttons.portals.animation:draw(buttons.portals.image, buttons.portals.pos.x, buttons.portals.pos.y, 0, buttons.portals.resize.w, buttons.portals.resize.h)

    if DevelopmentMode then
        love.graphics.rectangle("line", 15 * Screen.resizeValue.w, 170 * Screen.resizeValue.h, 380 * Screen.resizeValue.w, 360 * Screen.resizeValue.h)
        love.graphics.rectangle("line", sprites.water.pos.x, sprites.water.pos.y, sprites.water.trueWidth, sprites.water.trueHeight)
    end

end

return game