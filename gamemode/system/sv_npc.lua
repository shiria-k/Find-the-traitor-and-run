function FTTR.SpawnNPCs()
    for i = 1, 15 do
        local npc = ents.Create("npc_citizen")
        if not IsValid(npc) then continue end

        npc:SetPos(VectorRand() * 2000)
        npc:Spawn()
        npc:SetModel("models/player/Group01/monsterboys_pm.mdl")

        npc:SetKeyValue("targetname", "FTTR_NPC")

        npc:AddRelationship("player D_HT 99")

        function npc:Think()
            for _, ply in ipairs(player.GetAll()) do
                if ply.FTTR_Role == FTTR.Roles.INNOCENT then
                    self:SetEnemy(ply)
                end
            end
        end
    end
end
function FTTR.SpawnNPCs()
    for i = 1, 15 do
        local npc = ents.Create("npc_citizen")
        if not IsValid(npc) then continue end

        npc:SetPos(VectorRand() * 2000)
        npc:Spawn()
        npc:SetModel("models/player/monsterboys_pm.mdl) 

        -- Nur Innocents angreifen
        npc:AddRelationship("player D_HT 99")
        function npc:Think()
            for _, ply in ipairs(player.GetAll()) do
                if ply.FTTR_Role == FTTR.Roles.INNOCENT then
                    self:SetEnemy(ply)
                end
            end
        end
    end
end
