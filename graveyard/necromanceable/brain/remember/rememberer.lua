function saveGame()
    data.saveCount = data.saveCount + 1
    data.playerX = player:getX()
    data.playerY = player:getY()
    data.map = loadedeMap

    if data.fileNumber == 1 then
        love.filesystem.write("saveData.lua", table.show(data, ""))
    end
end