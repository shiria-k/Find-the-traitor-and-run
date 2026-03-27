-- shared.lua 

ENT.Type = "anim"                         
ENT.Base = "base_gmodentity"                

ENT.PrintName = "Munitions-Kiste"           
ENT.Author = "Dein Name"
ENT.Contact = ""
ENT.Purpose = "Gibt Munition für Pistolen"
ENT.Instructions = "Drücke E zum Aufheben"

ENT.Spawnable = false                       
ENT.AdminSpawnable = true                   
ENT.Category = "Find Traitor Pro"           

-- Falls du das Entity später im Shop kaufbar machst:
ENT.ShopPrice = 150                          

function ENT:SetupDataTables()
    
end
