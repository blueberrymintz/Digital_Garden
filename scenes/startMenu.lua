local game = {}

function game:load()
    
        startMenu = {}
startMenu.gridX = 1
startMenu.sprite = love.graphics.newImage('sprites/scuffed_menu/selectStartMenu.png')
startMenu.grid = anim8.newGrid((startMenu.sprite:getWidth()/3), 480, startMenu.sprite:getWidth(), startMenu.sprite:getHeight())
startMenu.animations = {}
startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)

end

function game:update(dt)
    startMenu.animations.grow:update((dt*0.5))
    if MousePos.x > 20 and MousePos.x < 110 and MousePos.y > 70 and MousePos.y < 90 then
        startMenu.gridX = 3
    elseif MousePos.x > 20 and MousePos.x < 110 and MousePos.y > 100 and MousePos.y < 120 then
            startMenu.gridX = 2
    else
        startMenu.gridX = 1
    end
    startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)
end
function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
    
end



return game