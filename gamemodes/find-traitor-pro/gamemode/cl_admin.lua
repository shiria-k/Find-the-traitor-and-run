concommand.Add("ftp_admin", function()
    if not LocalPlayer():IsAdmin() then return end

    local frame = vgui.Create("DFrame")
    frame:SetSize(300, 200)
    frame:Center()
    frame:SetTitle("Admin Panel")
    frame:MakePopup()

    local start = vgui.Create("DButton", frame)
    start:SetText("Runde starten")
    start:SetSize(200, 40)
    start:SetPos(50, 50)

    start.DoClick = function()
        RunConsoleCommand("ftp_start")
    end
end)
concommand.Add("ftp_start", function(ply)
    if IsValid(ply) and not ply:IsAdmin() then return end
    FTP:StartGame()
end)
