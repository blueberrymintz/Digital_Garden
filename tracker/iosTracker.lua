CurrentScreenX = 1
CurrentScreenY = 1
CurrentScreenWidth = 100
CurrentScreenHeight = 200
function ResizeIOS(button)
    
    if button == "j" then
        CurrentScreenWidth = CurrentScreenWidth + 10
    end
    if button == "g" then
        CurrentScreenWidth = CurrentScreenWidth - 10
    end
    if button == "y" then
        CurrentScreenHeight = CurrentScreenHeight - 10
    end
    if button == "h" then
        CurrentScreenHeight = CurrentScreenHeight + 10
    end

print("Current Screen Size: " .. CurrentScreenWidth .. "x" .. CurrentScreenHeight)
end