AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local GameStarted = false
local SpawnPos = Vector(0, 0, 0) -- Setze hier deine Map-Mitte/Spawn
local SpawnRadius = 393 -- ca. 10 Meter (1 Meter ~ 39.37 Units)

-- Spieler-Setup beim Joinen
function GM:PlayerInitialSpawn(ply)
    ply:SetModel("models/player/group01/male_01.mdl") -- Standard, Skin setzen via ID:
    ply:SetNWInt("Role", ROLE_INNOCENT)
    ply:SetNWInt("Money", 0)
    ply:SetNWInt("Wins", ply:GetPData("TotalWins", 0))
end

-- Spawn Schutz & Anti-PVP
function GM:EntityTakeDamage(target, info)
    local attacker = info:GetAttacker()
    if target:IsPlayer() or target:IsNPC() then
        if target:GetPos():Distance(SpawnPos) < SpawnRadius then
            info:ScaleDamage(0)
        end
    end
end

-- Spielstart Logik
function CheckStartCondition()
    if GameStarted then return end
    local playersOutside = 0
    for _, ply in ipairs(player.GetAll()) do
        if ply:GetPos():Distance(SpawnPos) > SpawnRadius then
            playersOutside = playersOutside + 1
        end
    end

    if playersOutside >= 4 then
        StartGame()
    end
end
timer.Create("GameStartCheck", 5, 0, CheckStartCondition)

function StartGame()
    GameStarted = true
    local plys = player.GetAll()
    local count = #plys
    
    -- Traitor Auswahl
    local traitorCount = 1
    if count >= 20 then traitorCount = 3 elseif count >= 10 then traitorCount = 2 end
    
    local shuffled = table.Copy(plys)
    table.Shuffle(shuffled)
    
    for i, ply in ipairs(shuffled) do
        ply:Spawn() -- Teleport zum Spawn
        if i <= traitorCount then
            ply:SetNWInt("Role", ROLE_TRAITOR)
        else
            ply:SetNWInt("Role", ROLE_INNOCENT)
        end
    end
    
    SpawnNPCs()
    SpawnWeapons()
    PrintMessage(HUD_PRINTTALK, "Spiel hat begonnen!")
end

-- NPC Spawning (Greifen nur Innocent an)
function SpawnNPCs()
    for i=1, 15 do
        local npc = ents.Create("npc_combine_s")
        npc:SetPos(SpawnPos + Vector(math.random(-1000,1000), math.random(-1000,1000), 100))
        npc:Spawn()
        -- Logik für Zielsuche müsste in OnTaskFailed/Think stehen
    end
end

-- Shop Command
hook.Add("PlayerSay", "ShopCommand", function(ply, text)
    if text == "!shop" then
        if ply:GetNWInt("Money") >= 100 then
            ply:SetNWInt("Money", ply:GetNWInt("Money") - 100)
            ply:Give("weapon_shotgun")
        else
            ply:ChatPrint("Nicht genug Geld!")
        end
        return ""
    end
end)
include("sv_player.lua")
