local function assignBox(obj, bufferZone)
    if obj.x == nil or obj.y == nil or obj.width == nil or obj.height == nil then
        error("Object must have x, y, width, and height defined")
    end

    
end
function MakeObject(name, x, y, width, height, sprite)
    if name == nil or type(name) ~= "string" then
        error("Invalid name for object: " .. tostring(name))
    end
    local obj = {
        name = name,
        x = x or nil,
        y = y or nil,
        width = width or nil,
        height = height or nil,
        sprite = sprite or nil
    }
    return obj
end