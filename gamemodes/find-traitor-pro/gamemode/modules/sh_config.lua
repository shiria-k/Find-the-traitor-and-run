
FTP_Config = {}

FTP_Config.PlayerModel = "models/player/group01/monsterboys_pm.mdl" 
FTP_Config.NPCModel    = "models/tm_leet_variantA.mdl"

FTP_Config.MinPlayersToStart = 4      
FTP_Config.SpawnRadius       = 393    
FTP_Config.WeaponResetTime   = 180    
FTP_Config.NPCCount          = 15     

FTP_Config.TraitorScales = {
    [20] = 3,
    [10] = 2,
    [4]  = 1
}

FTP_Config.StartMoney        = 0
FTP_Config.TraitorKillReward = 50
FTP_Config.ShopPriceShotgun  = 100

FTP_Config.MsgRoundStart = "DIE RUNDE HAT BEGONNEN! FINDE DEN TRAITOR!"
FTP_Config.MsgTraitorWin = "DER TRAITOR HAT GEWONNEN!"
FTP_Config.MsgInnoWin    = "DIE INNOCENTS HABEN GEWONNEN!"

print("[FTP] Konfiguration erfolgreich geladen!")

FTP_Config.Shop = {
    ["shotgun"] = { 
        class = "weapon_shotgun", 
        name = "Schrotflinte",
        price = 100 
    },
    ["traitor_pistol"] = { 
        class = "weapon_my_swep", 
        name = "Verräter Pistole",
        price = 150,
        traitorOnly = true
    }
}
