hook.Add("PlayerInitialSpawn", "FTP_Init", function(ply)
    FTP:ResetPlayer(ply)
    ply:SetModel("models/player/Group01/tm_leet_variantA.mdl")
end)

hook.Add("PlayerSpawn", "FTP_Spawn", function(ply)
    ply:SetNWInt("Wins", ply:GetNWInt("Wins", 0))
end)

hook.Add("EntityTakeDamage", "NoSpawnDamage", function(target, dmg)
    if target:IsPlayer() then
        if target:GetPos():Distance(FTP.SpawnPos) < FTP.Config.SpawnProtectionRadius then
            return true
        end
    end
end)

hook.Add("PlayerDeath", "FTP_Death", function(victim, inflictor, attacker)
    if FTP:GetRole(victim) == "Innocent" then
        timer.Simple(3, function()
            if IsValid(victim) then victim:Spawn() end
        end)
    end

    if FTP:GetRole(victim) == "Traitor" then
        PrintMessage(HUD_PRINTTALK, "Traitor wurde getötet!")

        if IsValid(attacker) and attacker:IsPlayer() then
            FTP:AddMoney(attacker, FTP.Config.TraitorKillReward)
        end

        FTP.GameStarted = false
    end
end)
hook.Add("PlayerDeath", "FTP_Death", function(victim, inflictor, attacker)

    -- Innocent respawn
    if FTP:GetRole(victim) == "Innocent" then
        timer.Simple(3, function()
            if IsValid(victim) then victim:Spawn() end
        end)
    end

    -- Traitor stirbt
    if FTP:GetRole(victim) == "Traitor" then

        PrintMessage(HUD_PRINTTALK, "Traitor wurde getötet!")

        -- 💰 Geld Belohnung
        if IsValid(attacker) and attacker:IsPlayer() then
            FTP:AddMoney(attacker, FTP.Config.TraitorKillReward)

            -- 🏆 WIN SYSTEM (DAS IST PUNKT 6)
            attacker:SetNWInt("Wins", attacker:GetNWInt("Wins", 0) + 1)
        end

        FTP.GameStarted = false
    end

end)
include("Modules/sv_database.lua")
