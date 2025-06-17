local function keyCutter()

end
function UpdateKey(key, inputValue)
    if type(key) ~= string then
        print("UpdateKey expected: String, Received:" .. type(key))
        return error("UpdateKey expected: string, Received: ".. type(key))
    end
    if type(inputValue) ~= string then
        return error("UpdateKey expected: string, Received: ".. tyoe(value))
    end
end

MusicKey = 1