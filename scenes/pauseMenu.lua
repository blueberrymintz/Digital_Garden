local game = {}

function game:load()
    --prints to terminal
    print("Warp Successful! Current Scene: Pause Menu")
    GlobalCurrentScene = 'pauseMenu'
end

function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.print("Warp Successful!", 200, 300)
end

function game:update(dt)
    
end

return game