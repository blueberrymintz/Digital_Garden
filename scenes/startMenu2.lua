local game = {}

function game:load()
    print("Warp Successful! Current Scene: Start Menu Alt")
    GlobalCurrentScene = "startMenuAlt"
    pixelFontSize = 10 * Screen.resizeValue
    pixelFont = love.graphics.newFont('fonts/tight_pixel.ttf', pixelFontSize*3)
    smallPixelFont = love.graphics.newFont('fonts/tight_pixel.ttf', pixelFontSize)
    mediumPixelFont = love.graphics.newFont('fonts/tight_pixel.ttf', pixelFontSize*2)
end

function game:resize(w, h)
    -- the start menu should be the only place that the screen can be resized

end

function game:keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'shift' and 'd' then
        DevelopmentMode = true
        print("Development Mode Enabled")
    end

end

function game:mousepressed(mouseX, mouseY, button)

end

function game:mousereleased(mouseX, mouseY, button)

end

function game:update(dt)
    
end

function game:draw()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.print("KITBASH", pixelFont, 0, 10)
    love.graphics.print("START", mediumPixelFont, 0, 30)
    love.graphics.print("press ESC to quit", smallPixelFont, 0, 70)
end

return game