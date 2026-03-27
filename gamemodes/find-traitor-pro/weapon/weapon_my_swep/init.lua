AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

function SWEP:PrimaryAttack()

    if not self:CanPrimaryAttack() then return end

    local bullet = {}
    bullet.Num = 1
    bullet.Src = self.Owner:GetShootPos()
    bullet.Dir = self.Owner:GetAimVector()
    bullet.Spread = Vector(0.01, 0.01, 0)
    bullet.Tracer = 1
    bullet.Force = 5
    bullet.Damage = 45 
    bullet.AmmoType = "Pistol"

    self.Owner:FireBullets(bullet)
    
    self:EmitSound("Weapon_Pistol.NPC_Single")
    self:ShootEffects()
    
    self:TakePrimaryAmmo(1)
    
    self.Owner:ViewPunch(Angle(-1, 0, 0))
end

function SWEP:SecondaryAttack()
end

function SWEP:Equip(newOwner)
    if newOwner:IsPlayer() and newOwner:GetNWInt("Role") != 2 then
        
        newOwner:ChatPrint("Diese Waffe fühlt sich falsch an... (Nur für Traitor!)")
        self:Remove()
    end
end
