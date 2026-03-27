hook.Add("PostPlayerDraw", "FTP_Wins", function(ply)
    local pos = ply:GetPos() + Vector(0,0,85)
    local ang = LocalPlayer():EyeAngles()

    ang:RotateAroundAxis(ang:Right(), 90)

    cam.Start3D2D(pos, Angle(0, ang.y, 90), 0.2)
        draw.SimpleText("Wins: "..ply:GetNWInt("Wins"),
            "DermaDefault", 0, 0, Color(255,255,255), TEXT_ALIGN_CENTER)
    cam.End3D2D()
end)
include("Modules/cl_leaderboard.lua")
