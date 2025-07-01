local game = {}

local anim8 = require 'libraries/anim8-master/anim8'

local sprites = {}

function game:load()
    -- elevator sprites



   sprites.elevator = {}
   sprites.elevator.sprite = love.graphics.newImage("sprites/sterileElevator/sterileElevatorSpriteSheet.png")
   sprites.elevator.resizeValue = {w = Screen.resizeValue.w * 0.15, h = Screen.resizeValue.h * 0.15}
   sprites.elevator.grid = anim8.newGrid(sprites.elevator.sprite:getWidth()/2, sprites.elevator.sprite:getHeight(), sprites.elevator.sprite:getWidth(), sprites.elevator.sprite:getHeight())
   sprites.elevator.position = {x = 100, y = 300}

   sprites.elevator.truePos = {x = sprites.elevator.position.x * Screen.resizeValue.w, y = sprites.elevator.position.y * Screen.resizeValue.h}

   sprites.elevator.animations = {}
   sprites.elevator.animations.g = anim8.newAnimation(sprites.elevator.grid('1-2',1), 1)

   sprites.button = {}
   sprites.button.grid = {}
   sprites.button.position = {}
   sprites.button.animations = {}
   sprites.button.sprite = {}

   sprites.button.sprite.down = love.graphics.newImage("sprites/elevator/downArrow/downArrowSpriteSheet.png")
   sprites.button.sprite.up = love.graphics.newImage("sprites/elevator/upArrow/upArrowSpriteSheet.png")

   sprites.button.resizeValue = {w = Screen.resizeValue.w * 0.5, h = Screen.resizeValue.h * 0.5}
    -- up button

   sprites.button.grid.down = anim8.newGrid(sprites.button.sprite.down:getWidth()/2, sprites.button.sprite.down:getHeight(), sprites.button.sprite.down:getWidth(), sprites.button.sprite.down:getHeight())
    sprites.button.position.down = {x = 200 * Screen.resizeValue.w, y = 300 * Screen.resizeValue.h}
    sprites.button.animations.down = anim8.newAnimation(sprites.button.grid.down('1-2', 1), 0.1)
    sprites.button.animations.down:gotoFrame(1, 1)

    sprites.button.grid.up = anim8.newGrid(sprites.button.sprite.up:getWidth() / 2, sprites.button.sprite.up:getHeight(), sprites.button.sprite.up:getWidth(), sprites.button.sprite.up:getHeight())
    sprites.button.position.up = {x = 200 * Screen.resizeValue.w, y = 200 * Screen.resizeValue.h}
    sprites.button.animations.up = anim8.newAnimation(sprites.button.grid.up('1-2', 1), 0.1)
    sprites.button.animations.up:gotoFrame(1, 1)

    
    print("ElevatorX = " ..  sprites.elevator.position.x .. " ElevatorY = " .. sprites.elevator.position.y)
    print("button.position.down = " ..  sprites.button.position.down.x .. " " .. sprites.button.position.down.y .. " button.position.up = " .. sprites.button.position.up.x .. " " .. sprites.button.position.up.y)
end
local callElevator = false
function game:keypressed(key, scancode, isrepeat)
    if key == "1" then
        sprites.elevator.animations.g:gotoFrame( 2, 1)
    end
    if key == "2" then
        sprites.elevator.animations.g:gotoFrame( 1, 1)
    end
end

function game:mousepressed(mouseX, mouseY, button)

end

function game:mousereleased(mouseX, mouseY, button)

end

function game:update(dt)
    
end

function game:draw()
    sprites.elevator.animations.g:draw(sprites.elevator.sprite, sprites.elevator.position.x, sprites.elevator.position.y, 0, sprites.elevator.resizeValue.w, sprites.elevator.resizeValue.h)
    sprites.button.animations.down:draw(sprites.button.sprite.down, sprites.button.position.down.x, sprites.button.position.down.y, 0, sprites.button.resizeValue.w, sprites.button.resizeValue.h)
    sprites.button.animations.up:draw(sprites.button.sprite.up, sprites.button.position.up.x, sprites.button.position.up.y, 0, sprites.button.resizeValue.w, sprites.button.resizeValue.h)

end

return game