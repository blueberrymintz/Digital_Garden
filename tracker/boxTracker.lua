function NewBoxTracker(boxLeft, boxRight, boxTop, boxBottom)
    local mousex = love.mouse.getX()
    local mousey = love.mouse.getY()
    if mousex > boxLeft and mousex < boxRight and mousey > boxTop and mousey < boxBottom then
        return 1
    else
        return 2
    end
end
