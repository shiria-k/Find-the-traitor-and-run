
net.Receive("FTP_ShopNotify", function()
    local item = net.ReadString()
    local success = net.ReadBool()
    
    if success then
        notification.AddLegacy("Gekauft: " .. item, NOTIFY_GENERIC, 4)
        surface.PlaySound("items/ammocan_open.wav")
    else
        notification.AddLegacy("Nicht genug Geld für " .. item .. "!", NOTIFY_ERROR, 4)
        surface.PlaySound("buttons/button10.wav")
    end
end)

local startAlpha = 0
net.Receive("FTP_RoundStartVisual", function()
    startAlpha = 255
    surface.PlaySound("ambient/alarms/warningbell1.wav")
end)

hook.Add("HUDPaint", "FTP_StartOverlay", function()
    if startAlpha > 0 then
        local text = "DIE RUNDE HAT BEGONNEN!"
        draw.SimpleText(text, "DermaLarge", ScrW()/2, ScrH()/2, Color(255, 255, 255, startAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        startAlpha = math.max(0, startAlpha - FrameTime() * 100)
    end
end)

function GM:DrawDeathNotice(x, y)

end

print("[FTP] UI-Module geladen!")
