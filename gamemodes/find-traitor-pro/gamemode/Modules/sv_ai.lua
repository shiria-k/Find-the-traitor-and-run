FTP = FTP or {}

function FTP:FindNearestInnocent(npc)
    local target = nil
    local dist = math.huge

    for _, ply in ipairs(player.GetAll()) do
        if self:GetRole(ply) == "Innocent" and ply:Alive() then
            local d = npc:GetPos():Distance(ply:GetPos())
            if d < dist then
                dist = d
                target = ply
            end
        end
    end

    return target
end

function FTP:SetupNPC(npc)
    npc:SetHealth(100)
    npc:SetMaxHealth(100)

    timer.Create("NPC_AI_"..npc:EntIndex(), 1, 0, function()
        if not IsValid(npc) then return end

        local target = FTP:FindNearestInnocent(npc)
        if IsValid(target) then
            npc:SetLastPosition(target:GetPos())
            npc:SetSchedule(SCHED_CHASE_ENEMY)
            npc:SetEnemy(target)
        end
    end)
end
