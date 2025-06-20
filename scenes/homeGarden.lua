local garden = {}
local function csetScene(foo)
    LastScene = GlobalCurrentScene
    garden.setScene(foo)
end
function garden:load()
    GlobalCurrentScene = "garden"
    --prints to terminal
    print("Warp Successful! Current Scene: Home Garden")


end

function garden:keypressed(key, scancode, isrepeat)
    if key then
        print("Key Pressed:" .. key, "Scancode:" .. scancode, "Is Repeat:" .. tostring(isrepeat))
    end
    if key == 'escape' then
        -- if escape is pressed open pause menu
        print("Attempting warp: pauseMenu")
        csetScene('pauseMenu')
    end
end

function garden:mousepressed(mouseX, mouseY, button)
    -- prints mouse position and button pressed
    if button then
        print('Mouse X:' .. mouseX .. '  Mouse Y:' .. mouseY .. '  Button:' .. button)
    end
end

function garden:mousereleased(mouseX, mouseY, button)
    -- resets the mouse button pressed
    if button then
        print('Mouse Released X:' .. mouseX .. '  Mouse Released Y:' .. mouseY .. '  Button:' .. button)
    end
end

function garden:update(dt)

end


function garden:draw()
    --background to black
    love.graphics.setBackgroundColor(0,0,0)
    --draws to screen
    love.graphics.print("Warp Successful! Current Scene: Home Garden", 200, 300)
end

return garden