
function GM:ShouldCollide(ent1, ent2)
    return true
end

hook.Add("PlayerShouldTakeDamage", "FTP_SpawnDamagePrevent", function(ply, attacker)
    -- Nutzt die Position aus der Config (muss in sh_config.lua stehen)
    local spawnPos = Vector(0, 0, 0) 
    local radius = 393 -- 10 Meter

    if ply:GetPos():Distance(spawnPos) < radius then
        return false 
    end
end)

hook.Add("EntityFireBullets", "FTP_NoSpawnShooting", function(ent, data)
    if ent:IsPlayer() and ent:GetPos():Distance(Vector(0,0,0)) < 393 then
        return false 
    end
end)

hook.Add("Move", "FTP_PlayerSpeed", function(ply, mv)
    end
end)

print("[FTP] Shared Hooks geladen!")
