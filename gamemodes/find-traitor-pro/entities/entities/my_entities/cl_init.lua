include("shared.lua") 

function ENT:Draw()
    self:DrawModel() 
    
    local pos = self:GetPos() + Vector(0, 0, 50) 
    local ang = LocalPlayer():EyeAngles()
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), 90)

    cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.25)
        draw.DrawText("MEIN ITEM", "DermaDefault", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    cam.End3D2D()
end

function ENT:Think()
    
end
