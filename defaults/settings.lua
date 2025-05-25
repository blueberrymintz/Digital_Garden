local debugMode
ZoomValue = 1
function InitializeGame(clearGraphics, debugMode)
    if clearGraphics == 1 then
    love.graphics.setDefaultFilter("nearest", "nearest")
    else
    end
    --wraps to screen size
        if debugMode == 1 then
        love.window.setMode(0, 0, {resizable=nil, vsync=0, minwidth=90, minheight=160})
        end
    -- for approximate phone screen size, resizeable
        if debugMode == 2 then
        love.window.setMode(270, 480, {resizeable=true, vsync=0, minwidth=90, minheight=160})
        end
     -- for approximate phone screen size, NOT resizeable
        if debugMode == 2 then
        love.window.setMode(270, 480, {resizeable=true, vsync=0, minwidth=90, minheight=160})
        end
    -- wraps to screen size, resizeable
        if debugMode == 3 then 
        love.wind.setMode(0,0, {resizable=true, vsync= 0})
        end
end



