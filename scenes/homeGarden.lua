local game = {}

function game:load()
    print("Warp Successful!")
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.print("Warp Successful! Current Scene: Garden (placeholder)", 0, 300)
end

function game:update(Gdt)
end

return game