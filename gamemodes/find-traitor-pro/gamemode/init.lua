AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
include("Modules/sh_config.lua")
include("Modules/sh_core.lua")

FTP.GameStarted = false
FTP.SpawnPos = Vector(0,0,0)

local function SpawnNPCs()
    for i = 1, FTP.Config.NPCCount do
        local npc = ents.Create("npc_citizen")
        npc:SetPos(VectorRand() * 2000)
        npc:Spawn()
        npc:SetSkin(FTP.Config.SkinNPC)

        function npc:OnTakeDamage(dmg)
            if IsValid(dmg:GetAttacker()) and dmg:GetAttacker():IsPlayer() then
                if FTP:GetRole(dmg:GetAttacker()) == "Traitor" then
                    return 0
                end
            end
        end
    end
end

local function SpawnGuns()
    for i = 1, FTP.Config.GunCount do
        local gun = ents.Create("weapon_pistol")
        gun:SetPos(VectorRand() * 2000)
        gun:Spawn()
    end
end

function FTP:StartGame()
    if self.GameStarted then return end
    self.GameStarted = true

    for _, ply in ipairs(player.GetAll()) do
        ply:SetPos(self.SpawnPos)
        ply:StripWeapons()
    end

    -- Rollen verteilen
    local players = player.GetAll()
    local shuffled = table.Copy(players)
    table.Shuffle(shuffled)

    local traitors = self:GetTraitorCount()

    for i, ply in ipairs(shuffled) do
        if i <= traitors then
            self:SetRole(ply, "Traitor")
        else
            self:SetRole(ply, "Innocent")
        end
    end

    SpawnNPCs()
    SpawnGuns()

    timer.Create("GunRespawn", FTP.Config.GunRespawnTime, 0, function()
        for _, ent in ipairs(ents.FindByClass("weapon_pistol")) do
            ent:Remove()
        end
        SpawnGuns()
    end)

    PrintMessage(HUD_PRINTTALK, "Spiel gestartet!")
end

hook.Add("Think", "AutoStart", function()
    if FTP.GameStarted then return end

    local outside = 0

    for _, ply in ipairs(player.GetAll()) do
        if ply:GetPos():Distance(FTP.SpawnPos) > FTP.Config.SpawnProtectionRadius then
            outside = outside + 1
        end
    end

    if outside >= FTP.Config.MinPlayersToStart then
        FTP:StartGame()
    end
end)
