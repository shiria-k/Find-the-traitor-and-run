hook.Add("PlayerDeath", "FTTR_WinCheck", function(victim, inflictor, attacker)
    if not FTTR.RoundActive then return end

    if victim.FTTR_Role == FTTR.Roles.TRAITOR then
        PrintMessage(HUD_PRINTTALK, "Innocents haben gewonnen!")

        if attacker:IsPlayer() then
            attacker.FTTR_Money = attacker.FTTR_Money + 50
        end

        FTTR.EndRound()
    end
end)

function FTTR.EndRound()
    FTTR.RoundActive = false

    for _, ply in ipairs(player.GetAll()) do
        ply:StripWeapons()
    end

    for _, ent in ipairs(ents.FindByClass("npc_*")) do
        ent:Remove()
    end
end
