hook.Add("HUDPaint", "FTTR_HUD", function()
    local ply = LocalPlayer()
    if not ply.FTTR_Role then return end

    draw.SimpleText(
        "Role: " .. (ply.FTTR_Role == 1 and "Innocent" or "Traitor"),
        "DermaLarge",
        ScrW() - 200, 20,
        color_white
    )

    draw.SimpleText(
        "Money: $" .. (ply.FTTR_Money or 0),
        "DermaLarge",
        ScrW() - 200, 60,
        color_white
    )
end)
