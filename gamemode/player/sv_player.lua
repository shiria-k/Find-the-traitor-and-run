hook.Add("PlayerInitialSpawn", "FTTR_Init", function(ply)
    ply:SetModel("models/player/Group01/tm_leet_variantA.mdl")
    ply.FTTR_Money = FTTR.Config.StartMoney
    ply.FTTR_Wins = 0
    ply.FTTR_Role = FTTR.Roles.INNOCENT
end)

hook.Add("PlayerSpawn", "FTTR_Respawn", function(ply)
    ply:StripWeapons()
end)
hook.Add("PlayerInitialSpawn", "FTTR_Init", function(ply)
    ply:SetModel("models/player/tm_leet_variantA.mdl") 
    ply.FTTR_Money = FTTR.Config.StartMoney
    ply.FTTR_Wins = 0
    ply.FTTR_Role = FTTR.Roles.INNOCENT
end)
