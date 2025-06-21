Settings = {}
--default settings
Settings.muteSFX = nil
Settings.muteMusic = nil
Settings.darkMode = true
Settings.debugMode = 4
Settings.clearGraphics = 1
Settings.printDevTools = 1
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
        love.window.setMode(270, 480, {resizeable=nil, vsync=0, minwidth=90, minheight=160})
        end
    -- wraps to screen size, resizeable
        if debugMode == 4 then 
        love.window.setMode(0,0, {resizable=nil, vsync= 0})
        end

    love.graphics.setBackgroundColor(300,300,300)
end
function UpdateSettings(muteSFX, muteMusic, darkMode)
    
end

function Settings:callFacts()
    print("Settings:callFacts() called")
    print("Mute SFX: " .. tostring(Settings.muteSFX))
    print("Mute Music: " .. tostring(Settings.muteMusic))
    print("Dark Mode: " .. tostring(Settings.darkMode))
end

