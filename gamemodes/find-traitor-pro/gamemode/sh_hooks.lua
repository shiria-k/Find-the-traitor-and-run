hook.Add("PlayerSay", "FTP_Shop", function(ply, text)
    if text == "!shop" then
        if ply:GetNWInt("Money") >= 100 then
            ply:Give("weapon_shotgun")
            ply:SetNWInt("Money", ply:GetNWInt("Money") - 100)
            ply:ChatPrint("Shotgun gekauft!")
        else
            ply:ChatPrint("Nicht genug Geld!")
        end
        return ""
    end
end)
