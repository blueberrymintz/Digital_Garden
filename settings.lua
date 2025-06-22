Settings = {}
--default settings
Settings.muteSFX = nil
Settings.muteMusic = nil
Settings.darkMode = true
Settings.debugMode = 3
Settings.clearGraphics = 1
Settings.printDevTools = 3
function InitializeGame(clearGraphics, debugMode)
    if clearGraphics == 1 then
    love.graphics.setDefaultFilter("nearest", "nearest")
    end
    --wraps to screen size
        if debugMode == 1 then
        love.window.setMode(0, 0, {resizable=true, vsync=0, minwidth=90, minheight=160})
        end
    -- for approximate phone screen size, resizeable
        if debugMode == 2 then
        love.window.setMode(520, 800, {resizable = true, vsync=0, minwidth=400, minheight=300})
        end
     -- for approximate phone screen size, NOT resizeable
        if debugMode == 3 then
        love.window.setMode(270, 630, {vsync=0, minwidth=270, minheight= 630})
        end
    -- wraps to screen size, resizeable
        if debugMode == 4 then 
        love.window.setMode(0,0, {resizable=nil, vsync= 0})
        end
    -- for actually running in mobile simulator, NOT resizeable
        if debugMode == 5 then
            love.window.setMode(90,210, {resizable = true, vsync = 0, minwidth = 1, minheight = 2})
        end
end
function UpdateSettings(muteSFX, muteMusic, darkMode)
    
end

function Settings:callFacts()
    print("Settings:callFacts() called")
    print("Mute SFX: " .. tostring(Settings.muteSFX))
    print("Mute Music: " .. tostring(Settings.muteMusic))
    print("Dark Mode: " .. tostring(Settings.darkMode))
end

