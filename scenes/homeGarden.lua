local garden = {}
local function csetScene(foo)
    LastScene = GlobalCurrentScene
    garden.setScene(foo)
end
function garden:load()
    GlobalCurrentScene = "garden"
    --prints to terminal
    print("Warp Successful! Current Scene: Home Garden")
    garden.sprite = love.graphics.newImage(sprites/homeGarden/gardenBackground.png)
    garden.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    garden.position = {x = Screen.centerX, y = Screen.centerY}
    garden.offset = {x = (garden.sprite:getWidth() / 2), y = (garden.sprite:getHeight() / 2)}
    garden.animations = {}
    garden.animations.background = anim8.newAnimation(anim8.newGrid(garden.sprite:getWidth(), garden.sprite:getHeight(), garden.sprite:getWidth(), garden.sprite:getHeight())(1, 1), 0.1)
    garden.animations.background:gotoFrame(1, 1)
    -- sets the current scene to gardenBackground

    

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