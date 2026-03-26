AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local GameStarted = false
local SpawnPos = Vector(0, 0, 0) 
local SpawnRadius = 393 

function GM:PlayerInitialSpawn(ply)
    ply:SetModel("models/player/group01/monsterboys_pm.mdl") 
    ply:SetNWInt("Role", ROLE_INNOCENT)
    ply:SetNWInt("Money", 0)
    ply:SetNWInt("Wins", ply:GetPData("TotalWins", 0))
end

function GM:EntityTakeDamage(target, info)
    local attacker = info:GetAttacker()
    if target:IsPlayer() or target:IsNPC() then
        if target:GetPos():Distance(SpawnPos) > spawnradius then
            info:ScaleDamage(0)
        end
    end
end

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
        ply:Spawn() 
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

-- NPC Spawning 
function SpawnNPCs()
    for i=1, 15 do
        local npc = ents.Create("npc_combine_s")
        npc:SetPos(SpawnPos + Vector(math.random(-1000,1000), math.random(-1000,1000), 100))
        npc:Spawn()
        
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

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("sh_hooks.lua")
AddCSLuaFile("modules/sh_config.lua")
AddCSLuaFile("modules/cl_ui.lua")

include("shared.lua")
include("sh_hooks.lua")
include("sv_player.lua")
include("modules/sh_config.lua")
include("modules/sv_network.lua")

function CheckNPCVictory()
    if not GameStarted then return end

    local activeNPCs = ents.FindByClass("npc_combine_s")
    local count = 0
    
    for _, npc in ipairs(activeNPCs) do
        if IsValid(npc) and npc:Health() > 0 then
            count = count + 1
        end
    end

    if count == 0 then
        local msg = "ALLE NPCs BESIEGT! DIE INNOCENTS GEWINNEN!"
        PrintMessage(HUD_PRINTTALK, msg)
        
        for _, ply in ipairs(player.GetAll()) do
            if ply:GetNWInt("Role") == ROLE_INNOCENT and ply:Alive() then
                ply:SetNWInt("Money", ply:GetNWInt("Money") + 25)
            end
        end

        EndFTPGame("Innocents") 
    end
end

hook.Add("OnNPCKilled", "FTP_NPCDeathCheck", function(victim, attacker, inflictor)
    
    timer.Simple(1, function()
        CheckNPCVictory()
    end)
end)

