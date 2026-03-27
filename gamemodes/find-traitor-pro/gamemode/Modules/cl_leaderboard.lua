net.Receive("FTP_SendLeaderboard", function()
    local data = net.ReadTable()

    local frame = vgui.Create("DFrame")
    frame:SetSize(400, 500)
    frame:Center()
    frame:SetTitle("Leaderboard")
    frame:MakePopup()

    local y = 40

    for i, v in ipairs(data) do
        local label = vgui.Create("DLabel", frame)
        label:SetPos(20, y)
        label:SetSize(360, 30)

        label:SetText(i .. ". " .. v.name .. " | Wins: " .. v.wins .. " | $" .. v.money)

        y = y + 30
    end
end)
