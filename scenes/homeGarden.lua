local game = {}


function game:load()
     -- self drawn plant animations, some values to be held seperately
    BadPlants = {}
BadPlants.sprite = love.graphics.newImage('sprites/PLANT_SPRITES_BAD/h_sprite_sheet.png')
BadPlants.grid = anim8.newGrid(520, 520, BadPlants.sprite:getWidth(), BadPlants.sprite:getHeight())
BadPlants.animations = {}
BadPlants.animations.grow = anim8.newAnimation(BadPlants.grid('1-5', 1), 0.1)
end

function game:draw()
    BadPlants.animations.grow:draw(BadPlants.sprite, 0, 200, nil, 0.5)
end

function game:update(dt)
    BadPlants.animations.grow:update((dt*0.5))

end

return game