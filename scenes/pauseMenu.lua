local game = {}
local function csetScene(foo)
    if foo == "trueLastScene" then
        game.setScene(LastScene)
    else
    game.setScene(foo)
    end
    LastScene = GlobalCurrentScene
end
function game:load()
    --prints to terminal
    print("Warp Successful! Current Scene: Pause Menu")
    GlobalCurrentScene = 'pauseMenu'
end

function game:keypressed(key, scancode, isrepeat)
    if key == 'm' then
        csetScene("startMenu")
    end
    if key == 'b' then
        csetScene("trueLastScene")
    end
end

function game:mousepressed(mouseX, mouseY, button)

end

function game:mousereleased(mouseX, mouseY, button)
    
end

function game:update(dt)
    
end


function game:draw()
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.print("Warp Successful!", 200, 300)
end

return game