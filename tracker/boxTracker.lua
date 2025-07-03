function BoxTracker2(x , y, length, height, mouseX, mouseY)
local boxLeft = x
local boxRight = x + length
local boxTop = y
local boxBottom = y + height
local mouseX = mouseX or love.mouse.getX()
local mouseY = mouseY or love.mouse.getY()
        if mouseX > boxLeft and mouseX < boxRight and mouseY > boxTop and mouseY < boxBottom then
        return 1
    else
        return 2
    end
end


