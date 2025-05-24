local debugMode
ZoomValue = 1
function InitializeGame(debugMode)
    if debugMode == 1 then
    love.window.setMode(270, 480, {resizable=true, vsync=0, minwidth=90, minheight=160})
    love.graphics.setDefaultFilter("nearest", "nearest")
    end
    if debugMode == 2 then
        love.window.setMode(270, 480, {resizeable=nil, vsync=0, minwidth=90, minheight=160})
        love.graphics.setDefaultFilter("nearest", "nearest")
end

end
