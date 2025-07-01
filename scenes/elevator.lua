local game = {}

local anim8 = require 'libraries/anim8-master/anim8'
local cron = require "libraries.cronLua_Master.cron"




local function csetScene(sceneKey)
    game.setScene(sceneKey)
end


local sprites = {}

function game:load()
    -- elevator sprites



   sprites.elevator = {}
   sprites.elevator.sprite = love.graphics.newImage("sprites/sterileElevator/sterileElevatorSpriteSheet.png")
   sprites.elevator.resizeValue = {w = Screen.resizeValue.w * 0.15, h = Screen.resizeValue.h * 0.15}
   sprites.elevator.grid = anim8.newGrid(sprites.elevator.sprite:getWidth()/2, sprites.elevator.sprite:getHeight(), sprites.elevator.sprite:getWidth(), sprites.elevator.sprite:getHeight())
   sprites.elevator.position = {x = 50, y = 300}

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

   sprites.button.resizeValue = {w = Screen.resizeValue.w * 0.4, h = Screen.resizeValue.h * 0.4}
    -- up button

    sprites.button.grid.up = anim8.newGrid(sprites.button.sprite.up:getWidth() / 2, sprites.button.sprite.up:getHeight(), sprites.button.sprite.up:getWidth(), sprites.button.sprite.up:getHeight())
    sprites.button.position.up = {x = 320 * Screen.resizeValue.w, y = 350 * Screen.resizeValue.h}
    sprites.button.animations.up = anim8.newAnimation(sprites.button.grid.up('1-2', 1), 0.1)
    sprites.button.animations.up:gotoFrame(1, 1)


    sprites.button.grid.down = anim8.newGrid(sprites.button.sprite.down:getWidth()/2, sprites.button.sprite.down:getHeight(), sprites.button.sprite.down:getWidth(), sprites.button.sprite.down:getHeight())
    sprites.button.position.down = {x = 320 * Screen.resizeValue.w, y = 450 * Screen.resizeValue.h}
    sprites.button.animations.down = anim8.newAnimation(sprites.button.grid.down('1-2', 1), 0.1)
    sprites.button.animations.down:gotoFrame(1, 1)

    sprites.button.position.up.truePos = {x = sprites.button.position.up.x * sprites.button.resizeValue.w, y = sprites.button.position.up.y * sprites.button.resizeValue.h}
    sprites.button.position.down.truePos = {x = sprites.button.position.down.x * sprites.button.resizeValue.w, y = sprites.button.position.down.y * sprites.button.resizeValue.h}

    print("ElevatorX = " ..  sprites.elevator.position.x .. " ElevatorY = " .. sprites.elevator.position.y)
    print("button.position.down = " ..  sprites.button.position.down.x .. " " .. sprites.button.position.down.y .. " button.position.up = " .. sprites.button.position.up.x .. " " .. sprites.button.position.up.y)
end
local callElevator = false
local function elevatorArrival()

    print("The elevator has arrived!")
    callElevator = false
end

local callElevatorClock = cron.after(5, elevatorArrival)





function game:keypressed(key, scancode, isrepeat)
    if key == "1" then
        sprites.elevator.animations.g:gotoFrame( 2, 1)
    end
    if key == "2" then
        sprites.elevator.animations.g:gotoFrame( 1, 1)
    end
    if key == "escape" then
        csetScene("startMenuRewrite")
    end
end

function game:mousepressed(mouseX, mouseY, button)
    local upArrowBox = BoxTracker2(sprites.button.position.up.x, sprites.button.position.up.y, sprites.button.position.up.truePos.x, sprites.button.position.up.truePos.y, mouseX, mouseY)
    local downArrowBox = BoxTracker2(sprites.button.position.down.x, sprites.button.position.down.y, sprites.button.position.down.truePos.x, sprites.button.position.down.truePos.y, mouseX, mouseY)
    
    if button and upArrowBox == 1 then
        print("Up Arrow Pressed")
        sprites.button.animations.up:gotoFrame(2, 1)
        callElevator = true
    end
    if button and downArrowBox == 1 then
        print("Down Arrow Pressed")
        sprites.button.animations.down:gotoFrame(2, 1)
        callElevator = true
    end

end

function game:mousereleased(mouseX, mouseY, button)
    

end

function game:update(dt)
    if callElevator then
        callElevatorClock:update(dt)
    end
    

end

function game:draw()
    sprites.elevator.animations.g:draw(sprites.elevator.sprite, sprites.elevator.position.x, sprites.elevator.position.y, 0, sprites.elevator.resizeValue.w, sprites.elevator.resizeValue.h)
    sprites.button.animations.down:draw(sprites.button.sprite.down, sprites.button.position.down.x, sprites.button.position.down.y, 0, sprites.button.resizeValue.w, sprites.button.resizeValue.h)
    sprites.button.animations.up:draw(sprites.button.sprite.up, sprites.button.position.up.x, sprites.button.position.up.y, 0, sprites.button.resizeValue.w, sprites.button.resizeValue.h)

end

return game