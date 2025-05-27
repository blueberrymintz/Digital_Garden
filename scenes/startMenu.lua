local game = {}
 

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
    if MousePos.x > 150 and MousePos.x < 350 and MousePos.y > 550 and MousePos.y < 620 then
        startMenu.gridX = 2
        if MouseDown == 2 then
            startMenu.gridX = 4
        end

    elseif MousePos.x > 150 and MousePos.x < 350 and MousePos.y > 650 and MousePos.y < 720 then
            startMenu.gridX = 3
    else
        startMenu.gridX = 1
    end
    startMenu.animations.grow = anim8.newAnimation(startMenu.grid(startMenu.gridX, 1), 0.1)
end
function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
    
end



return game