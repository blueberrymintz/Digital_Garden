plant = {}
plant.sprite = love.graphics.newImage('sprites/plantBetter/betterPlantStage1.png')
plant.grid = anim8.newGrid(400, 400, plant.sprite:getWidth(), plant.sprite:getHeight())
plant.animations = {}
plant.animations.sway = anim8.newAnimation(plant.grid('1-7', 1), 0.1)
love.graphics.setBackgroundColor(300,300,300)