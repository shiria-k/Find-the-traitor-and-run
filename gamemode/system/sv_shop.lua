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
