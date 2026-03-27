
hook.Add("PlayerSay", "FTP_AdminCommands", function(ply, text)
    local cmd = string.lower(text)
    
    if cmd == "!start" then
        if ply:IsAdmin() or ply:IsSuperAdmin() then
            if not GameStarted then
                PrintMessage(HUD_PRINTTALK, "Admin " .. ply:Nick() .. " startet das Spiel manuell...")
                StartFTPGame() -- Funktion aus init.lua
            else
                ply:ChatPrint("Das Spiel läuft bereits!")
            end
        else
            ply:ChatPrint("Nur Admins können das Spiel starten.")
        end
        return "" 
    end
end)


function GM:PlayerDeath(victim, inflictor, attacker)

    victim:StripWeapons()
    
    
    if victim:GetNWInt("Role") == ROLE_TRAITOR then
        PrintMessage(HUD_PRINTTALK, "DER TRAITOR WURDE ELIMINIERT!")
    end
end

function GM:PlayerSpawn(ply)
    self.BaseClass.PlayerSpawn(ply) 
    
    -- Standard-Ausrüstung und Rolle
    ply:SetNWInt("Role", ROLE_INNOCENT)
    ply:SetModel("models/player/group01/monsterboys_pm.mdl") 
    
    
    if GameStarted then
        ply:StripWeapons()
        ply:ChatPrint("Das Spiel läuft bereits. Du bist ein Innocent!")
    end
end
-- Vorher: if money >= 100 then ...
-- Nachher (mit Config):
if ply:GetNWInt("Money") >= FTP_Config.Shop["shotgun"].price then
    ply:Give(FTP_Config.Shop["shotgun"].class)
end
util.AddNetworkString("FT_RoundState")

local roundActive = false
local roundTime = 60

function FT_StartRound()
    if #player.GetAll() < 2 then return end

    roundActive = true
    print("[FT] Round started")

    SelectTraitor()

    timer.Create("FT_RoundTimer", roundTime, 1, function()
        FT_EndRound("Innocents Win! Time ran out")
    end)
end

function FT_EndRound(reason)
    if not roundActive then return end

    roundActive = false
    print("[FT] Round ended: " .. reason)

    timer.Remove("FT_RoundTimer")

    for _, ply in ipairs(player.GetAll()) do
        ply:SetNWBool("FT_IsTraitor", false)
    end

    timer.Simple(5, FT_StartRound)
end
