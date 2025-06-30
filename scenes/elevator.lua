local game = {}

function game:load()
    -- elevator sprites


    elevator = {}
    elevator.sprite = love.graphics.newImage("sprites/sterileElevator/sterileElevatorSpriteSheet.png")
    elevator.resizeValue = (Screen.resizeValue * OSresizeValue) * 0.3
    elevator.grid = anim8.newGrid(elevator.sprite:getWidth()/2, elevator.sprite:getHeight(), elevator.sprite:getWidth(), elevator.sprite:getHeight())
    elevator.position = {x = Screen.centerX, y = Screen.centerY}
    elevator.offset = {x = (elevator.sprite:getWidth() / 2), y = (elevator.sprite:getHeight() / 2)}
    elevator.animations = {}
    elevator.animations.g = anim8.newAnimation(elevator.grid('1-2',1))
end

function game:keypressed(key, scancode, isrepeat)
    if key == "1" then
        elevator.animations:gotoFrame(2, 1)
    end
end

function game:mousepressed(mouseX, mouseY, button)

end

function game:mousereleased(mouseX, mouseY, button)

end

function game:update(dt)
    
end

function game:draw()
    elevator.animations.g:draw(elevator.sprite, elevator.position.x, elevator.position.y, 0, elevator.resizeValue, elevator.resizeValue, elevator.offset.x, elevator.offset.y)
end

return game