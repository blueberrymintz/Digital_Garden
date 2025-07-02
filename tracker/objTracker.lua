-- this file is meant to keep track of objects that need to be called and saved across scenes and their states. 
-- ex: watering can and whether or not it's filled




HeldObject = nil
GlobalWaterCan = {}
GlobalWaterCan.objString = "waterCan"
GlobalWaterCan.isFull = false
GlobalWaterCan.waterCharges = 0
GlobalWaterCan.maxWaterCharges = 1
GlobalWaterCan.isPouring = false
GlobalWaterCan.isHeld = false

local function loadObject(objString)
	-- Placeholder: simulate loading an object by string
	print("Loading object: " .. tostring(objString))
	return { objString = objString }
end

function LastHeldObject(objString)
	-- Placeholder: set LastHeldObject to a new object
	LastHeldObject = { objString = objString }
	print("Last held object set to: " .. tostring(objString))
end

function TapObject(objString)
    if objString == GlobalWaterCan.objString then
        GlobalWaterCan.isHeld = true
        HeldObject = "waterCan"
        print("Object " .. objString .. " is now held.")
    else
        print("No matching object found to hold: " .. tostring(objString))
    end
end
function DropObject(objString)
    if objString == GlobalWaterCan.objString then
        GlobalWaterCan.isHeld = false
        HeldObject = nil
        print("Object: " .. objString " has been dropped.")
    else
        print("No matching object found for string" .. tostring(objString))
    end

end