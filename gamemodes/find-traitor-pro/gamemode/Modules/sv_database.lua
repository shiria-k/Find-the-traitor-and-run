sql.Query("CREATE TABLE IF NOT EXISTS ftp_money (steamid TEXT, money INTEGER)")

function FTP:LoadMoney(ply)
    local id = ply:SteamID()
    local data = sql.Query("SELECT money FROM ftp_money WHERE steamid = "..sql.SQLStr(id))

    if data then
        ply:SetNWInt("Money", tonumber(data[1].money))
    else
        ply:SetNWInt("Money", 0)
    end
end

function FTP:SaveMoney(ply)
    local id = ply:SteamID()
    local money = ply:GetNWInt("Money", 0)

    sql.Query("REPLACE INTO ftp_money (steamid, money) VALUES ("..
        sql.SQLStr(id)..","..money..")")
end

hook.Add("PlayerInitialSpawn", "LoadMoney", function(ply)
    FTP:LoadMoney(ply)
end)

hook.Add("PlayerDisconnected", "SaveMoney", function(ply)
    FTP:SaveMoney(ply)
end)
