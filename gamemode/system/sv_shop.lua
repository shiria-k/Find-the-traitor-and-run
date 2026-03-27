hook.Add("PlayerSay", "FTTR_Shop", function(ply, text)
    if text == "!shop" then
        if ply.FTTR_Money >= 100 then
            ply:Give("weapon_shotgun")
            ply.FTTR_Money = ply.FTTR_Money - 100
            ply:ChatPrint("Shotgun gekauft!")
        else
            ply:ChatPrint("Nicht genug Geld!")
        end
        return ""
    end
end)
timer.Create("FTTR_AutoStart", 5, 0, function()
    if FTTR.RoundActive then return end

    local outside = 0

    for _, ply in ipairs(player.GetAll()) do
        if ply:GetPos():Distance(FTTR.SpawnPos) > FTTR.Config.SpawnProtectionRadius then
            outside = outside + 1
        end
    end

    if outside >= FTTR.Config.MinPlayers then
        FTTR.StartRound()
    end
end)
