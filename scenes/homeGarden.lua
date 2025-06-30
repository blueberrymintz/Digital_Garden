--[[ local garden = {}
local function csetScene(foo, args)
    LastScene = GlobalCurrentScene
    garden.setScene(foo, args)
end
function garden:load(args)
    GlobalCurrentScene = "garden"
    --prints to terminal
    print("Warp Successful! Current Scene: Home Garden")
    flower = {}
    flower.sprite = love.graphics.newImage('sprites/PLANT_SPRITES_BAD/flower.png')
    flower.resizeValue = (Screen.resizeValue * OSresizeValue) * 3
    flower.position = {x = Screen.centerX, y = Screen.centerY}
    flower.offset = {x = (flower.sprite:getWidth() / 2), y = (flower.sprite:getHeight() / 2)}
    flower.animations = {}
    flower.animations.background = anim8.newAnimation(anim8.newGrid(flower.sprite:getWidth(), flower.sprite:getHeight(), flower.sprite:getWidth(), flower.sprite:getHeight())(1, 1), 0.1)
    flower.animations.background:gotoFrame(1, 1)
    flower.watered = false
    -- sets the current scene to gardenBackground

    base = {}
    base.sprite = love.graphics.newImage('sprites/PLANT_SPRITES_BAD/plantBase/plantBaseSheet.png')
    base.resizeValue = {(Screen.resizeValue * OSresizeValue) * 3}
    base.position = {x = Screen.centerX, y = Screen.centerY}
    base.offset = {x = (base.sprite:getWidth() / 2), y = (base.sprite:getHeight() / 2)}
    base.animations = {}
    base.animations.default = anim8.newAnimation(anim8.newGrid(base.sprite:getWidth(), base.sprite:getHeight(), base.sprite:getWidth(), base.sprite:getHeight())(1, 1), 0.1)
    base.animations.default:gotoFrame(1, 1)
    base.drySoil = true

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
    if key == 'd' then
        -- if d key is pressed open sink
        print("Attempting warp: sink")
        csetScene('sink')
    end
end

function garden:mousepressed(mouseX, mouseY, button)
    -- prints mouse position and button pressed

end

function garden:mousereleased(mouseX, mouseY, button)
    -- resets the mouse button pressed

end

function garden:update(dt)

end


function garden:draw()
    --background to black
    love.graphics.setBackgroundColor(0,0,0)
    --draws to screen
    flower.animations.background:draw(flower.sprite, flower.position.x, flower.position.y, 0, flower.resizeValue, flower.resizeValue, flower.offset.x, flower.offset.y)
end

return garden ]]--