include("shared.lua")

function GM:HUDPaint()
    local ply = LocalPlayer()
    local role = ply:GetNWInt("Role") == 2 and "TRAITOR" or "INNOCENT"
    local money = ply:GetNWInt("Money")
    
    draw.SimpleText("Rolle: " .. role, "DermaDefault", ScrW() - 20, 20, Color(255,255,255), TEXT_ALIGN_RIGHT)
    draw.SimpleText("Geld: $" .. money, "DermaDefault", ScrW() - 20, 40, Color(0,255,0), TEXT_ALIGN_RIGHT)
end

-- Nameplate (Wins über Kopf)
hook.Add("PostPlayerDraw", "DrawWins", function(ply)
    if not ply:Alive() or ply == LocalPlayer() then return end
    local offset = Vector(0, 0, 80)
    local ang = LocalPlayer():EyeAngles()
    local pos = ply:GetPos() + offset + ang:Up()
    
    ang:RotateAroundAxis(ang:Forward(), 90)
    ang:RotateAroundAxis(ang:Right(), 90)
    
    cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.25)
        draw.DrawText("Wins: " .. ply:GetNWInt("Wins"), "DermaDefault", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    cam.End3D2D()
end)
