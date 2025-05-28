local game = {}
local cron = require('libraries/cronLua_Master/cron')
local mousePos = {}
mousePos.x = 0
mousePos.y = 0
local function csetScene(foo)
    game.setScene(foo)
end
local startClock = cron.after(1, csetScene, 'garden')
local settingsClock = cron.after(1, csetScene, 'settings')
function game:load()
    
        startMenu = {}
startMenu.gridX = 1
startMenu.sprite = love.graphics.newImage('sprites/scuffed_menu/JJmenu/sprite_sheet.png')
startMenu.grid = anim8.newGrid((startMenu.sprite:getWidth()/5), 1536, startMenu.sprite:getWidth(), startMenu.sprite:getHeight())
startMenu.animations = {}
startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)

end

function game:update(dt)
    local down = love.mouse.isDown(1)
    mousePos.x = love.mouse.getX()
    mousePos.y = love.mouse.getY()
    startMenu.animations.grow:update((dt*0.5))
    if mousePos.x > 150 and mousePos.x < 350 and mousePos.y > 550 and mousePos.y < 620 then
        startMenu.gridX = 2
        if down then
            startMenu.gridX = 4
            startClock:update(7*dt)
        end

elseif mousePos.x > 150 and mousePos.x < 350 and mousePos.y > 650 and mousePos.y < 720 then
            startMenu.gridX = 3
        if down then
            startMenu.gridX = 5
            settingsClock:update(7*dt)
        end

    else
   startMenu.gridX = 1
    end
    -- necessary. I don't know why but don't delete it, it's the only way we got it to work
    startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)
end
function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
    
end

return game
