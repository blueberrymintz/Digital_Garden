local game = {}

function game:load()
    --prints to terminal
    print("Warp Successful!")
end

function game:draw()
    --background to black
    love.graphics.setBackgroundColor(0,0,0)
    --prints to screen
    love.graphics.print("Warp Successful! Current Scene: Garden (placeholder)", 0, 300)
end

function game:update(dt)

end

return game