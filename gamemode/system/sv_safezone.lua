hook.Add("EntityTakeDamage", "FTTR_Safezone", function(target, dmg)
    if not target:IsPlayer() then return end

    if target:GetPos():Distance(FTTR.SpawnPos) < FTTR.Config.SpawnProtectionRadius then
        return true
    end
end)
