include("shared.lua") 

SWEP.DrawCrosshair = true

SWEP.Slot = 1                
SWEP.SlotPos = 1             
SWEP.DrawAmmo = true         
SWEP.BounceWeaponIcon = true

local clr = Color(255, 50, 50, 255)
function SWEP:DrawHUD()
    local x, y = ScrW() / 2, ScrH() / 2
    surface.SetDrawColor(clr)
    surface.DrawRect(x - 2, y - 2, 4, 4) 
end

function SWEP:TranslateFOV(current_fov)
    return current_fov 
end

function SWEP:PrintWeaponInfo(x, y, alpha)
    draw.SimpleText("SCHADEN: HOCH", "DermaDefault", x, y, Color(255, 0, 0, alpha))
    draw.SimpleText("NUR FÜR TRAITOR", "DermaDefault", x, y + 15, Color(255, 255, 255, alpha))
end

print("[FTP] Client-Teil der Waffe geladen!")
