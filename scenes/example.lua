local game = {}

function game:load()
    print("Warp Successful!")
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.print("Warp Successful!", 200, 300)
end

function game:update(dt)
    
end

return game