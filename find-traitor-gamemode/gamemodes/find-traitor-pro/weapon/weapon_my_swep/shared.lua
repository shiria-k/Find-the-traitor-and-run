SWEP.PrintName = "Traitor Pistol"
SWEP.Author = "Shira"
SWEP.Instructions = "Starke Waffe für Verräter"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true

SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 20
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"


SWEP.PrintName    = "Traitor Pistol"        
SWEP.Author       = "shira"
SWEP.Instructions = "Linksklick: Schießen | Rechtsklick: Zoom"
SWEP.Spawnable    = true                    
SWEP.AdminOnly    = false                  

SWEP.ViewModel    = "models/weapons/c_pistol.mdl"
SWEP.WorldModel   = "models/weapons/w_pistol.mdl"
SWEP.UseHands     = true                    

-- Primär-Feuer (Linksklick)
SWEP.Primary.ClipSize    = 10               
SWEP.Primary.DefaultClip = 30               
SWEP.Primary.Automatic   = true            
SWEP.Primary.Ammo        = "Pistol"         
SWEP.Primary.Delay       = 0.15             

-- Sekundär-Feuer (Rechtsklick)
SWEP.Secondary.ClipSize    = -1             
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic   = false
SWEP.Secondary.Ammo        = "none"

SWEP.Slot    = 1                            
SWEP.SlotPos = 1                            

function SWEP:Initialize()
    self:SetHoldType("pistol")              
end
