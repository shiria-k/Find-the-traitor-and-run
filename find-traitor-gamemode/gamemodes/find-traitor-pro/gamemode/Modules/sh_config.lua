
FTP_Config = {}

-- Spieler-Einstellungen
FTP_Config.PlayerModel = "models/player/group01/male_07.mdl" -- Ersetze durch Pfad von Skin 439849859
FTP_Config.StartMoney = 0
FTP_Config.TraitorKillReward = 50

-- Spiel-Logik
FTP_Config.MinPlayersToStart = 4
FTP_Config.SpawnProtectRadius = 393 -- 10 Meter (in Source Units)
FTP_Config.WeaponResetTime = 180    -- 3 Minuten (in Sekunden)

-- NPC-Einstellungen
FTP_Config.NPCModel = "models/combine_super_soldier.mdl" -- Ersetze durch Pfad von Skin 1720614156
FTP_Config.NPCCount = 15

-- Shop-Preise
FTP_Config.Shop = {
    ["shotgun"] = { 
        class = "weapon_shotgun", 
        price = 100 
    }
}

-- Traitor-Verteilung (Spieleranzahl = Traitor-Anzahl)
FTP_Config.TraitorScales = {
    [4] = 1,
    [10] = 2,
    [20] = 3
}

print("[FTP] Config wurde geladen!")
