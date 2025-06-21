CurrentScreenX = 1
CurrentScreenY = 1
CurrentScreenWidth = 100
CurrentScreenHeight = 200
function resizeIOS(button)
    
    if button == "right" then
        CurrentScreenWidth = CurrentScreenWidth + 10
    end
    if button == "left" then
        CurrentScreenWidth = CurrentScreenWidth - 10
    end
    if button == "up" then
        CurrentScreenHeight = CurrentScreenHeight - 10
    end
    if button == "down" then
        CurrentScreenHeight = CurrentScreenHeight + 10
    end
love.window.setMode(CurrentScreenWidth, CurrentScreenHeight, {resizeable=true, vsync=0, minwidth=10, minheight=10})
print("Current Screen Size: " .. CurrentScreenWidth .. "x" .. CurrentScreenHeight)
end