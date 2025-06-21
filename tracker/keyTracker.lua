
MusicKey = 2
SFXKey = 1
LastScene = nil
-- 1 = on, 2 = off
function UpdateMusicKey()
    if MusicKey == 1 then
        MusicKey = 2
        love.audio.stop()
        print("Music is now OFF")
    else MusicKey = 1
        print("Music is now ON")
    end
end
function UpdateSFXKey()
    if SFXKey == 1 then
        SFXKey = 2
        print("SFX is now OFF")
    else SFXKey = 1
        print("SFX is now ON")
    end
end
