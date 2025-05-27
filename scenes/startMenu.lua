local game = {}
local down = love.mouse.isDown(1)
local mousePos = {}
mousePos.x = 151
mousePos.y = 551
function game:load()
    
        startMenu = {}
startMenu.gridX = 1
startMenu.sprite = love.graphics.newImage('sprites/scuffed_menu/JJmenu/sprite_sheet.png')
startMenu.grid = anim8.newGrid((startMenu.sprite:getWidth()/5), 1536, startMenu.sprite:getWidth(), startMenu.sprite:getHeight())
startMenu.animations = {}
startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)

end

function game:update(dt)
    startMenu.animations.grow:update((dt*0.5))
    if mousePos.x > 150 and mousePos.x < 350 and mousePos.y > 550 and mousePos.y < 620 then
        startMenu.gridX = 2

elseif mousePos.x > 150 and mousePos.x < 350 and mousePos.y > 650 and mousePos.y < 720 then
            startMenu.gridX = 3

    else
   
    end

end
function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
    
end


        if down then
            startMenu.gridX = 4
        end
                    if down then
                startMenu.gridX = 5
            end
return game
