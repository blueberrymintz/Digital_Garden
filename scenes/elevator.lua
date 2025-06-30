local game = {}

local anim8 = require 'libraries/anim8-master/anim8'



function game:load()
    -- elevator sprites


    elevator = {}
    elevator.sprite = love.graphics.newImage("sprites/sterileElevator/sterileElevatorSpriteSheet.png")
    elevator.resizeValue = (Screen.resizeValue * OSresizeValue) * 0.5
    elevator.grid = anim8.newGrid(elevator.sprite:getWidth()/2, elevator.sprite:getHeight(), elevator.sprite:getWidth(), elevator.sprite:getHeight())
    elevator.position = {x = Screen.centerX, y = Screen.centerY}
    elevator.offset = {x = (elevator.sprite:getWidth() / 4), y = (elevator.sprite:getHeight() / 2)}
    elevator.truePos = {x = elevator.position.x + elevator.offset.x, y = elevator.position.y + elevator.offset.y}
    elevator.animations = {}
    elevator.animations.g = anim8.newAnimation(elevator.grid('1-2',1), 1)

    button = {}
    button.sprite = {}
    button.grid = {}
    button.position = {}
    button.animations = {}
    
    button.sprite.down = love.graphics.newImage("sprites/elevator/downArrow/downArrowSpriteSheet.png")
    button.sprite.up = love.graphics.newImage("sprites/elevator/upArrow/upArrowSpriteSheet.png")

    button.resizeValue = (Screen.resizeValue * OSresizeValue) * 2

    button.grid.down = anim8.newGrid(button.sprite.down:getWidth()/2, button.sprite.down:getHeight(), button.sprite.down:getWidth(), button.sprite.down:getHeight())
    button.position.down = {x = elevator.truePos.x - (elevator.sprite:getWidth() / 2) * elevator.resizeValue, y = Screen.centerY - (elevator.position.y / 2) * elevator.resizeValue }
    button.animations.down = anim8.newAnimation(button.grid.down('1-2', 1), 0.1)
    button.animations.down:gotoFrame(1, 1)

    button.grid.up = anim8.newGrid(button.sprite.up:getWidth() / 2, button.sprite.up:getHeight(), button.sprite.up:getWidth(), button.sprite.up:getHeight())
    button.position.up = {x = Screen.centerX + (elevator.sprite:getWidth() / 2) * elevator.resizeValue, y = Screen.centerY - (elevator.position.y / 2) * elevator.resizeValue }
    button.animations.up = anim8.newAnimation(button.grid.up('1-2', 1), 0.1)
    button.animations.up:gotoFrame(1, 1)

    
    print("ElevatorX = " ..  elevator.position.x .. " ElevatorY = " .. elevator.position.y)
    print("ElevatorOffsetX = " .. elevator.offset.x .. " ElevatorOffsetY = " .. elevator.offset.y)
    print("button.position.down = " ..  button.position.down.x .. " " .. button.position.down.y .. " button.position.up = " .. button.position.up.x .. " " .. button.position.up.y)
end
local callElevator = false
function game:keypressed(key, scancode, isrepeat)
    if key == "1" then
        elevator.animations.g:gotoFrame( 2, 1)
    end
    if key == "2" then
        elevator.animations.g:gotoFrame( 1, 1)
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
    button.animations.down:draw(button.sprite.down, button.position.down.x, button.position.down.y, 0, button.resizeValue, button.resizeValue)
    button.animations.up:draw(button.sprite.up, button.position.up.x, button.position.up.y, 0, button.resizeValue, button.resizeValue)

end

return game