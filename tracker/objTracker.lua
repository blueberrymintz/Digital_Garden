-- this file is meant to keep track of objects that need to be called and saved across scenes and their states. 
-- ex: watering can and whether or not it's filled




local heldObject = nil
local lastHeldObject = nil

WaterCan = {}
WaterCan.objString = "waterCan"
WaterCan.isFull = false
WaterCan.waterCharges = 0
WaterCan.maxWaterCharges = 1
WaterCan.isPouring = false
WaterCan.isHeld = false


function SetLastHeldObject(objString)
	-- Placeholder: set LastHeldObject to a new object

    if objString ~= nil then
    lastHeldObject = objString
    print("Last held object set to: " .. tostring(objString))
    end
end


function CallLastHeldObject()
    return tostring(lastHeldObject)
end

function CallHeldObject()
    
end

function SetHeldObject(objString)
    heldObject = objString

end

function TapObject(objString)
    if objString == WaterCan.objString then
        WaterCan.isHeld = true
        SetHeldObject(tostring(objString))
        print("Object " .. objString .. " is now held.")
    else
        print("No matching object found to hold: " .. tostring(objString))
    end
end

function DropObject(objString)
    if objString == WaterCan.objString then
        WaterCan.isHeld = false
        
        print("Object: " .. tostring(objString) .. " has been dropped.")
    else
        print("No matching object found for string" .. tostring(objString))
    end

end