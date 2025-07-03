function BoxTracker(x , y, length, height, mouseX, mouseY)
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
        
function ColliderTracker(style, x, y, length, height, x2, y2, length2, height2)
    -- type options: container (box within a collider) or intercept (box outside a collider)
    
    local collider = {
    l = x,
    r = x + length,
    t = y,
    b = y + height
    }
    local box = {
    l = x2,
    r = x2 + length2,
    t = y2,
    b = y2 + height2
    }
    if style == "container" then
        if box.l > collider.l and box.r < collider.r and box.t > collider.t and box.b < collider.b then 
            return 1
        else
            return 2
        end
    end
    if style == "intercept" then
        if not (box.l > collider.l and box.r < collider.r and box.t > collider.t and box.b < collider. b) then 
            return 1
        else
            return 2
        end
    end

    

end