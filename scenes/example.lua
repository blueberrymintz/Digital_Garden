local game = {}

function game:load()
    print("Warp Successful!")
end

function game:draw()
    love.graphics.print("Scenery makes life easier", 200, 300)
end

function game:update(Gdt)
end

return game