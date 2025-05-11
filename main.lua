
function love.load()
    anim8 = require 'libraries/anim8'
    plants = {}
plants.sprite = love.graphics.newImage('sprites/plants.png')
plants.grid = anim8.newGrid(12, 24, plants.sprite:getWidth(), plants.sprite:getHeight())
plants.animations = {}
plants.animations.sway = anim8.newAnimation(plants.grid('3 - 5', 1), 0.3 )
end

function love.update(dt)
plants.animations.sway:update(dt) 
end


function love.draw()
    plants.animations.sway:draw(plants.sprite, 100, 100)
end