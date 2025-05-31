local garden = {}

function garden:load()
    --prints to terminal
    print("Warp Successful!")

    windowsill = {}
        -- initializes the start menu sprites and animations
        -- DO NOT DELETE THIS
windowsill.gridX = 1
windowsill.sprite = love.graphics.newImage('sprites/plantBetter/windowsill.png')
windowsill.grid = anim8.newGrid(windowsill.sprite:getWidth(), windowsill.sprite:getHeight(), windowsill.sprite:getWidth(), windowsill.sprite:getHeight())
windowsill.animations = {}
windowsill.animations.grow = anim8.newAnimation(windowsill.grid(windowsill.gridX, 1), 0.1)
end



function garden:update(dt)
        -- necessary. I don't know why but don't delete it, it's the only way we got it to work
    windowsill.animations.grow = anim8.newAnimation(windowsill.grid(windowsill.gridX, 1), 0.1)
end
function garden:draw()
    --background to black
    love.graphics.setBackgroundColor(0,0,0)
    --draws to screen
    windowsill.animations.grow:draw(windowsill.sprite, 0, 0, nil, 0.1)
end

return garden