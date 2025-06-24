local game = {}
local function csetScene(foo)
    game.setScene(foo)
end
function game:load()
    csetScene ('startMenuAlt')
end

function game:draw()
    
end

function game:update(dt)
    
end

return game