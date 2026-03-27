FTP = FTP or {}

function FTP:SetRole(ply, role)
    ply:SetNWString("Role", role)
end

function FTP:GetRole(ply)
    return ply:GetNWString("Role", "Innocent")
end

function FTP:AddMoney(ply, amount)
    ply:SetNWInt("Money", ply:GetNWInt("Money", 0) + amount)
end

function FTP:ResetPlayer(ply)
    self:SetRole(ply, "Innocent")
    ply:SetNWInt("Money", FTP.Config.StartMoney)
end

function FTP:GetTraitorCount()
    local count = #player.GetAll()
    local result = 1

    for _, v in ipairs(FTP.Config.Traitors) do
        if count >= v.players then
            result = v.count
        end
    end

    return result
end
