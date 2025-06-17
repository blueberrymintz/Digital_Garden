local function verifyValue(value)
    if type)value) ~= string then
        print(value..'not provided, defaulting to zero')
        value = 0
    end
end
function CallBoxTracker(originX, originY, length, height, mouseX, mouseY, name)
    if type(name) ~= string or type(name) == nil then
        name = "NewBox"
        print('CallBoxTracker, no name provided; setting to default')
    end
    if mouseX > originX and mouseY > originY and mouseX < (originX + length) and mouseY < (originY + height) then
        return true
    else
        return false
    end
end
