GM.Name = "Find Traitor Pro"
GM.Author = "shirasophie"

ROLE_INNOCENT = 1
ROLE_TRAITOR = 2

function GM:Initialize()
    self.BaseClass.Initialize(self)
end
SWEP.PrintName = "Traitor Pistol"
SWEP.Author = "shirasophie"
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
