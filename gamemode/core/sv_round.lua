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
hook.Add("PostDrawOpaqueRenderables", "FTTR_DrawWins", 0, function()
    for _, ply in ipairs(player.GetAll()) do
        if not IsValid(ply) then continue end

        local pos = ply:GetPos() + Vector(0,0,80)
        local ang = Angle(0, LocalPlayer():EyeAngles().y - 90, 90)

        cam.Start3D2D(pos, ang, 0.25)
            draw.SimpleText(
                "Wins: " .. (ply.FTTR_Wins or 0),
                "DermaLarge",
                0, 0,
                Color(255,255,0),
                TEXT_ALIGN_CENTER,
                TEXT_ALIGN_CENTER
            )
        cam.End3D2D()
    end
end)
