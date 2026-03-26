-- Admin & Player Management

-- Admin Command zum manuellen Starten
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
        return "" -- Versteckt den Text im Chat
    end
end)

-- Verhalten bei Tod und Respawn
function GM:PlayerDeath(victim, inflictor, attacker)
    -- Waffen beim Tod entfernen
    victim:StripWeapons()
    
    -- Nachricht wenn Traitor stirbt (Ergänzung zu init.lua)
    if victim:GetNWInt("Role") == ROLE_TRAITOR then
        PrintMessage(HUD_PRINTTALK, "DER TRAITOR WURDE ELIMINIERT!")
    end
end

-- Sicherstellen, dass Respawnte oder Nachzügler Innocent sind
function GM:PlayerSpawn(ply)
    self.BaseClass.PlayerSpawn(ply) -- Standard GMod Spawn-Logik
    
    -- Standard-Ausrüstung und Rolle
    ply:SetNWInt("Role", ROLE_INNOCENT)
    ply:SetModel("models/player/group01/male_07.mdl") -- Dein Skin-Pfad hier
    
    -- Wenn das Spiel läuft, kriegt er keine Waffen automatisch (muss suchen)
    if GameStarted then
        ply:StripWeapons()
        ply:ChatPrint("Das Spiel läuft bereits. Du bist ein Innocent!")
    end
end
