FTP_ROLES = {
    [1] = {
        name = "Innocent",
        color = Color(50, 255, 50), -- Grün
        id = 1
    },
    [2] = {
        name = "Traitor",
        color = Color(255, 50, 50), -- Rot
        id = 2
    }
}

function IsInSpawn(ent)
    if not IsValid(ent) then return false end
    

    local spawnPos = Vector(0, 0, 0)
    local radius = FTP_Config.SpawnRadius or 393
    
    return ent:GetPos():Distance(spawnPos) < radius
end
 
function FormatFTPMoney(amount)
    return "$" .. string.Comma(amount)
end

function GM:CreateTeams()
    team.SetUp(1, "Innocents", FTP_ROLES[1].color)
    team.SetUp(2, "Traitors", FTP_ROLES[2].color)
end

print("[FTP] Core-Modul geladen!")
