function VerifyValue(value)
    if type(value) ~= string then
    value = 0
    print(value .. "not provided, defaulting to 0")
    end
end
function CallBoxTracker(originX, originY, length, height, mouseX, mouseY, name)
    if type(name) ~= string or type(name) == nil then
        name = "NewBox"
        print('CallBoxTracker, no name provided; setting to default')
    end
    VerifyValue(originX)
    VerifyValue(originY)
    VerifyValue(length)
    VerifyValue(height)
    VerifyValue(mouseX)
    VerifyValue(mouseY)
    if mouseX > originX and mouseY > originY and mouseX < (originX + length) and mouseY < (originY + height) then
        return true
    else
        return false
    end
end
function BoxTracker2(x , y, length, height,mouseX,mouseY)
local boxLeft = x
local boxRight = x + length
local boxTop = y
local boxBottom = y + height
        if mouseX > boxLeft and mouseX < boxRight and mouseY > boxTop and mouseY < boxBottom then
        return 1
    else
        return 2
    end
end


