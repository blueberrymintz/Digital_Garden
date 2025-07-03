local game = {}

local cron = require ('libraries/cronLua_Master/cron')
local anim8 = require ('libraries/anim8-master/anim8')
local boxTracker = require ('tracker/boxTracker')
local keys = require ('tracker/keyTracker')

local sprites = {}
local buttons = {}

local function csetScene(sceneKey)
    game.setScene(sceneKey)
end


function game:load()
    print("Warp Successful! Current Scene: Settings Menu Rewrite")

    sprites.settings = {}
    sprites.settings.image = love.graphics.newImage('sprites/settingsMenuRewrite/settingsSprite.png')
    sprites.settings.pos = {x = 0 * Screen.resizeValue.w, y = 0 * Screen.resizeValue.h}
    sprites.settings.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.settings.grid = anim8.newGrid(sprites.settings.image:getWidth(), sprites.settings.image:getHeight(), sprites.settings.image:getWidth(), sprites.settings.image:getHeight())
    sprites.settings.animation = anim8.newAnimation(sprites.settings.grid(1, 1), 0.1)
    sprites.settings.trueWidth = sprites.settings.image:getWidth() * sprites.settings.resize.w
    sprites.settings.trueHeight = sprites.settings.image:getHeight() * sprites.settings.resize.h
    
    sprites.SFX = {}
    sprites.SFX.image = love.graphics.newImage('sprites/settingsMenuRewrite/SFXsprite.png')
    sprites.SFX.pos = {x = 50 * Screen.resizeValue.w, y = 80 * Screen.resizeValue.h}
    sprites.SFX.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.SFX.grid = anim8.newGrid(sprites.SFX.image:getWidth(), sprites.SFX.image:getHeight(), sprites.SFX.image:getWidth(), sprites.SFX.image:getHeight())
    sprites.SFX.animation = anim8.newAnimation(sprites.SFX.grid(1, 1), 0.1)
    sprites.SFX.trueWidth = sprites.SFX.image:getWidth() * sprites.SFX.resize.w
    sprites.SFX.trueHeight = sprites.SFX.image:getHeight() * sprites.SFX.resize.h

    sprites.music = {}
    sprites.music.image = love.graphics.newImage('sprites/settingsMenuRewrite/musicSprite.png')
    sprites.music.pos = {x = 50 * Screen.resizeValue.w, y = 180 * Screen.resizeValue.h}
    sprites.music.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.music.grid = anim8.newGrid(sprites.music.image:getWidth(), sprites.music.image:getHeight(), sprites.music.image:getWidth(), sprites.music.image:getHeight())
    sprites.music.animation = anim8.newAnimation(sprites.music.grid(1, 1), 0.1)
    sprites.music.trueWidth = sprites.music.image:getWidth() * sprites.music.resize.w
    sprites.music.trueHeight = sprites.music.image:getHeight() * sprites.music.resize.h
    
    sprites.toggle = {}
    sprites.toggle.image = love.graphics.newImage('sprites/settingsMenuRewrite/toggleSpriteSheet.png')
    -- omitting usual sprites pos value to allow for multiple instances of toggle
    sprites.toggle.resize = {w = Screen.resizeValue.w, h = Screen.resizeValue.h}
    sprites.toggle.grid = anim8.newGrid(sprites.toggle.image:getWidth()/2, sprites.toggle.image:getHeight(), sprites.toggle.image:getWidth(), sprites.toggle.image:getHeight())
    
    sprites.toggle.trueWidth = sprites.toggle.image:getWidth() * sprites.toggle.resize.w
    sprites.toggle.trueHeight = sprites.toggle.image:getHeight() * sprites.toggle.resize.h

    sprites.toggle.animation = {}
    sprites.toggle.animation.SFX = anim8.newAnimation(sprites.toggle.grid('1-2', 1), 0.1)
    sprites.toggle.animation.music = anim8.newAnimation(sprites.toggle.grid('1-2', 1), 0.1)

    sprites.toggle.pos = {
        SFX = {x = 250 * Screen.resizeValue.w, y = 80 * Screen.resizeValue.h},
        music = {x = 250 * Screen.resizeValue.w, y = 180 * Screen.resizeValue.h}
    }
    if MusicKey == 1 then
        sprites.toggle.animation.music:gotoFrame(2, 1)
    elseif MusicKey == 2 then
        sprites.toggle.animation.music:gotoFrame(1, 1)
    end

    if SFXKey == 1 then
        sprites.toggle.animation.SFX:gotoFrame(2, 1)
    elseif SFXKey == 2 then
        sprites.toggle.animation.SFX:gotoFrame(1, 1)
    end
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

local function updateToggle(toggleString)
        if toggleString == 'SFX' then
            if SFXKey == 1 then
                SFXKey = 2
                sprites.toggle.animation.SFX:gotoFrame(1, 1)
            else
                SFXKey = 1
                sprites.toggle.animation.SFX:gotoFrame(2, 1)
            end
        elseif toggleString == 'music' then
            if MusicKey == 1 then
                MusicKey = 2
                sprites.toggle.animation.music:gotoFrame(1, 1)
            else
                MusicKey = 1
                sprites.toggle.animation.music:gotoFrame(2, 1)
        end
    end
end

function game:keypressed(key, scancode, isrepeat)
    if key == '1' then
        csetScene('startMenuRewrite')
    end

    if key == 's' then
        updateToggle('SFX')
    end

    if key == 'm' then
        updateToggle('music')
    end


end

function game:mousepressed(mouseX, mouseY, button)
    local SFXbox = BoxTracker(sprites.SFX.pos.x, sprites.SFX.pos.y, sprites.SFX.trueWidth, sprites.SFX.trueHeight, mouseX, mouseY)
    local musicBox = BoxTracker(sprites.music.pos.x, sprites.music.pos.y, sprites.music.trueWidth, sprites.music.trueHeight, mouseX, mouseY)
    local SFXtoggleBox = BoxTracker(sprites.toggle.pos.SFX.x, sprites.toggle.pos.SFX.y, sprites.toggle.trueWidth, sprites.toggle.trueHeight, mouseX, mouseY)
    local musicToggleBox = BoxTracker(sprites.toggle.pos.music.x, sprites.toggle.pos.music.y, sprites.toggle.trueWidth, sprites.toggle.trueHeight, mouseX, mouseY)
    if button == 1 and SFXbox == 1 then
        updateToggle('SFX')
    end
    if button == 1 and musicBox == 1 then
        updateToggle('music')
    end
    if button == 1 and SFXtoggleBox == 1 then
        updateToggle('SFX')
    end
    if button == 1 and musicToggleBox == 1 then
        updateToggle('music')
    end
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

function game:update(dt)
    
end

function game:draw()
    sprites.settings.animation:draw(sprites.settings.image, sprites.settings.pos.x, sprites.settings.pos.y, 0, sprites.settings.resize.w, sprites.settings.resize.h)
    sprites.SFX.animation:draw(sprites.SFX.image, sprites.SFX.pos.x, sprites.SFX.pos.y, 0, sprites.SFX.resize.w, sprites.SFX.resize.h)
    sprites.music.animation:draw(sprites.music.image, sprites.music.pos.x, sprites.music.pos.y, 0, sprites.music.resize.w, sprites.music.resize.h)
    sprites.toggle.animation.SFX:draw(sprites.toggle.image, sprites.toggle.pos.SFX.x, sprites.toggle.pos.SFX.y, 0, sprites.toggle.resize.w, sprites.toggle.resize.h)
    sprites.toggle.animation.music:draw(sprites.toggle.image, sprites.toggle.pos.music.x, sprites.toggle.pos.music.y, 0, sprites.toggle.resize.w, sprites.toggle.resize.h)

    buttons.settings.animation:draw(buttons.settings.image, buttons.settings.pos.x, buttons.settings.pos.y, 0, buttons.settings.resize.w, buttons.settings.resize.h)
        buttons.home.animation:draw(buttons.home.image, buttons.home.pos.x, buttons.home.pos.y, 0, buttons.home.resize.w, buttons.home.resize.h)
            buttons.portals.animation:draw(buttons.portals.image, buttons.portals.pos.x, buttons.portals.pos.y, 0, buttons.portals.resize.w, buttons.portals.resize.h)

end

return game