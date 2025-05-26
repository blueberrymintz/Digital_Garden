local game = {}

function game:load()
        startMenu = {}
startMenu.sprite = love.graphics.newImage('sprites/scuffed_menu/selectStartMenu.png')
startMenu.grid = anim8.newGrid((startMenu.sprite:getWidth()/3), 480, startMenu.sprite:getWidth(), startMenu.sprite:getHeight())
startMenu.animations = {}
startMenu.animations.grow = anim8.newAnimation(startMenu.grid('1-3', 1), 0.1)
end

function game:draw()
    startMenu.animations.grow:draw(startMenu.sprite, 0, 0, nil, 0.5)
end

function game:update(dt)
    startMenu.animations.grow:update((dt*0.5))
end

return game