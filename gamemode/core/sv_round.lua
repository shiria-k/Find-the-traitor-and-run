util.AddNetworkString("FTTR_UpdateHUD")

FTTR.RoundActive = false
FTTR.SpawnPos = Vector(0,0,0)

function FTTR.StartRound()
    if FTTR.RoundActive then return end

    local players = player.GetAll()
    if #players < FTTR.Config.MinPlayers then return end

    FTTR.RoundActive = true

    for _, ply in ipairs(players) do
        ply:SetPos(FTTR.SpawnPos)
        ply:StripWeapons()
    end

    FTTR.AssignRoles()
    FTTR.SpawnNPCs()
    FTTR.SpawnWeapons()

    PrintMessage(HUD_PRINTTALK, "[FTTR] Runde gestartet!")
end
function FTTR.AssignRoles()
    local players = player.GetAll()
    local traitorCount = FTTR.GetTraitorCount(#players)

    for _, ply in ipairs(players) do
        ply.FTTR_Role = FTTR.Roles.INNOCENT
    end

    for i = 1, traitorCount do
        local ply = table.Random(players)
        ply.FTTR_Role = FTTR.Roles.TRAITOR
        table.RemoveByValue(players, ply)
    end
end
