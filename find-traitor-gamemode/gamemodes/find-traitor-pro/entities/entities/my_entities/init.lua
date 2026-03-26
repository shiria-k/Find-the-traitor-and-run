AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")  
include("shared.lua")       

function ENT:Initialize()
    -- Modell festlegen (z.B. eine Munitionskiste)
    self:SetModel("models/items/boxsrounds.mdl") 
    
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if IsValid(phys) then
        phys:Wake()
    end
    
    print("[FTP] Entity " .. self:GetClass() .. " wurde gespawnt!")
end

function ENT:Use(activator, caller)
    if IsValid(activator) and activator:IsPlayer() then
        activator:GiveAmmo(30, "Pistol", true)
        
        activator:ChatPrint("Du hast Munition gefunden!")
        
        self:EmitSound("items/ammo_pickup.wav")
        
        self:Remove()
    end
end

function ENT:OnTakeDamage(dmginfo)
    
end
