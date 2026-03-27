
FTTR.Weapons = {}

function FTTR.SpawnWeapons()
    for i = 1, 15 do
        local wep = ents.Create("weapon_pistol")
        if not IsValid(wep) then continue end

        wep:SetPos(VectorRand() * 2000)
        wep:Spawn()

        table.insert(FTTR.Weapons, wep)
    end

    timer.Create("FTTR_WeaponRespawn", FTTR.Config.WeaponRespawnTime, 0, function()
        for _, w in ipairs(FTTR.Weapons) do
            if IsValid(w) then w:Remove() end
        end
        FTTR.Weapons = {}
        FTTR.SpawnWeapons()
    end)
end
