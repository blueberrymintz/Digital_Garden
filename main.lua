function love.load()
anim8 = require 'libraries.anim8'
think = require 'defaults.thinker'
set = require 'defaults.settings'
input = require 'tracker.keyInput'
cron = require 'libraries/cronLua_Master/cron'
player = require 'defaults/player'
ScreenType = {1, 1}

end

function love.update(dt)
local clock = cron.after(1, InitializeGame, ScreenType[1], ScreenType[2])
end

function love.draw()

end