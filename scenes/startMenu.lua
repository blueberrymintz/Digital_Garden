local game = {}

local function csetScene(foo)
    -- this function is used to change the scene and set the last scene
    LastScene = GlobalCurrentScene
    game.setScene(foo)
end
local boxTracker = require("tracker/boxTracker")
function game:load()
    print("Warp Successful! Current Scene: Start Menu Alt")
    GlobalCurrentScene = "startMenuAlt"
    sprites = {}
    sprites.kitbash = {}
    sprites.START = {}
    sprites.SETTINGS = {}
    local resizeValue = Screen.resizeValue
    FIRSTSTART = false
    OSresizeValue = 1
    if OS_String == 'iOS' then
        OSresizeValue = 1
        love.window.setMode(402, 874, {vsync=0, minwidth=270, minheight= 630})
    end
    if OS_String == 'OS X' or 'Linux' then
        OSresizeValue = 0.1
    end

    -- sprites

        local resizeValue = Screen.resizeValue

        sprites.kitbash.resizeValue = resizeValue * OSresizeValue
        sprites.kitbash.image = love.graphics.newImage('sprites/start_menu/kitbash.png')
        sprites.kitbash.grid = anim8.newGrid(sprites.kitbash.image:getWidth(), sprites.kitbash.image:getHeight(), sprites.kitbash.image:getWidth(), sprites.kitbash.image:getHeight())
        sprites.kitbash.animation = anim8.newAnimation(sprites.kitbash.grid(1, 1), 0.1)
        sprites.kitbash.stretch = {x = 1, y = 1}
        sprites.kitbash.position = {x = 0, y = (Screen.centerY - (sprites.kitbash.image:getHeight() * sprites.kitbash.resizeValue) / 2) /3}
        
        sprites.START.resizeValue = (resizeValue * 0.5) * OSresizeValue
        sprites.START.position = {x = 1, y = 60}
        sprites.START.image = love.graphics.newImage('sprites/start_menu/startMenu2/start.png')
        sprites.START.grid = anim8.newGrid(sprites.START.image:getWidth(), sprites.START.image:getHeight(), sprites.START.image:getWidth(), sprites.START.image:getHeight())
        sprites.START.animation = anim8.newAnimation(sprites.START.grid(1, 1), 0.1)
        sprites.START.position = {x = 0, y = sprites.kitbash.position.y + sprites.kitbash.image:getHeight() * sprites.kitbash.resizeValue + 20}
        

        sprites.SETTINGS.resizeValue = (resizeValue * 0.5) * OSresizeValue
        sprites.SETTINGS.position = {x = 1, y = 120}
        sprites.SETTINGS.image = love.graphics.newImage('sprites/start_menu/startMenu2/settings.png')
        sprites.SETTINGS.grid = anim8.newGrid(sprites.SETTINGS.image:getWidth(), sprites.SETTINGS.image:getHeight(), sprites.SETTINGS.image:getWidth(), sprites.SETTINGS.image:getHeight())
        sprites.SETTINGS.animation = anim8.newAnimation(sprites.SETTINGS.grid(1, 1), 0.1)
        sprites.SETTINGS.position = {x = 0, y = sprites.START.position.y + sprites.START.image:getHeight() * sprites.START.resizeValue + 20}
        
end

function game:resize(w, h)
    -- the start menu should be the only place that the screen can be resized

end

function game:keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 's' then
        print("attempting warp to home garden")
        csetScene('garden')
    end
    if key == 'h' then
        print('W: ' .. love.graphics.getWidth() .. ' H: ' .. love.graphics.getHeight())
    end
    if key == 'c' then
        love.window.setMode(270, 630, {vsync=0, minwidth=270, minheight= 630})
        OS = 'macOS'
        csetScene('fixer')
    end
end

function game:mousepressed(mouseX, mouseY, button)
    sprites.kitbash.box = BoxTracker2(sprites.kitbash.position.x, sprites.kitbash.position.y, sprites.kitbash.image:getWidth() * sprites.kitbash.resizeValue, sprites.kitbash.image:getHeight() * sprites.kitbash.resizeValue, mouseX, mouseY)
    sprites.START.box = BoxTracker2(sprites.START.position.x, sprites.START.position.y, sprites.START.image:getWidth() * sprites.START.resizeValue, sprites.START.image:getHeight() * sprites.START.resizeValue, mouseX, mouseY)
    sprites.SETTINGS.box = BoxTracker2(sprites.SETTINGS.position.x, sprites.SETTINGS.position.y, sprites.SETTINGS.image:getWidth() * sprites.SETTINGS.resizeValue, sprites.SETTINGS.image:getHeight() * sprites.SETTINGS.resizeValue, mouseX, mouseY)
    if sprites.kitbash.box == 1 then
        print("Kitbash clicked")
    end
    if sprites.START.box == 1 then
        print("Start clicked")
        print('Attempting warp to home garden')
        csetScene('garden')
    end
    if sprites.SETTINGS.box == 1 then
        print("Settings clicked")
        csetScene('settings')
    end

end

function game:mousereleased(mouseX, mouseY, button)

end

function game:update(dt)
    
end

function game:draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    sprites.kitbash.animation:draw(sprites.kitbash.image, sprites.kitbash.position.x, sprites.kitbash.position.y, 0, sprites.kitbash.resizeValue, sprites.kitbash.resizeValue)
    sprites.START.animation:draw(sprites.START.image, sprites.START.position.x, sprites.START.position.y, 0, sprites.START.resizeValue, sprites.START.resizeValue)
    sprites.SETTINGS.animation:draw(sprites.SETTINGS.image, sprites.SETTINGS.position.x, sprites.SETTINGS.position.y, 0, sprites.SETTINGS.resizeValue, sprites.SETTINGS.resizeValue)

end

return game