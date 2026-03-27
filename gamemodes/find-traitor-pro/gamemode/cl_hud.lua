hook.Add("HUDPaint", "FTP_HUD", function()
    local ply = LocalPlayer()

    draw.SimpleText("Rolle: " .. ply:GetNWString("Role"),
        "Trebuchet24", ScrW()-200, 20, Color(255,255,255))

    draw.SimpleText("Geld: $" .. ply:GetNWInt("Money"),
        "Trebuchet24", ScrW()-200, 50, Color(0,255,0))
end)
