
util.AddNetworkString("FTP_RoleUpdate")      
util.AddNetworkString("FTP_MoneyUpdate")     
util.AddNetworkString("FTP_RoundNotify")     
util.AddNetworkString("FTP_ShopFeedback")    

function SendPlayerRole(ply)
    if not IsValid(ply) then return end
    net.Start("FTP_RoleUpdate")
        net.WriteInt(ply:GetNWInt("Role", 1), 4) 
    net.Send(ply)
end

function SendPlayerMoney(ply)
    if not IsValid(ply) then return end
    net.Start("FTP_MoneyUpdate")
        net.WriteInt(ply:GetNWInt("Money", 0), 32)
    net.Send(ply)
end

function BroadcastRoundMessage(text, isWin)
    net.Start("FTP_RoundNotify")
        net.WriteString(text)
        net.WriteBool(isWin or false)
    net.Broadcast() 
end

print("[FTP] Networking-Modul geladen!")
