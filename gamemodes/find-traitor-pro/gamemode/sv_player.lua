
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
