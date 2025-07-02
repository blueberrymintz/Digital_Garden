-- Basic Object Tracker for tracking and managing objects across scenes

local ObjectTracker = {}

-- Table to store all tracked objects by their unique string key
local trackedObjects = {}

-- Add or update an object in the tracker
function ObjectTracker.setObject(key, object)
    if type(key) ~= "string" then
        error("Object key must be a string")
    end
    trackedObjects[key] = object
end

-- Retrieve an object by its key
function ObjectTracker.getObject(key)
    return trackedObjects[key]
end

-- Remove an object from the tracker
function ObjectTracker.removeObject(key)
    trackedObjects[key] = nil
end

-- Return all tracked objects (for debugging or iteration)
function ObjectTracker.getAllObjects()
    return trackedObjects
end