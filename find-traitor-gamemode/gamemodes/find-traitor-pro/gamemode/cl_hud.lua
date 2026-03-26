
local function DrawFTPHUD()
    local ply = LocalPlayer()
    if not IsValid(ply) then return end

    local margin = 20
    local width = 180
    local height = 70
    local x = ScrW() - width - margin
    local y = margin

    draw.RoundedBox(8, x, y, width, height, Color(0, 0, 0, 180))

    local role = ply:GetNWInt("Role", 1) -- 1 = Innocent, 2 = Traitor
    local roleText = "INNOCENT"
    local roleColor = Color(50, 255, 50) -- Grün

    if role == 2 then
        roleText = "TRAITOR"
        roleColor = Color(255, 50, 50) -- Rot
    end

    draw.SimpleText(roleText, "DermaLarge", x + (width / 2), y + 20, roleColor, TEXT_ALIGN_CENTER)

    local money = ply:GetNWInt("Money", 0)
    draw.SimpleText("Geld: $" .. money, "DermaDefault", x + (width / 2), y + 50, Color(255, 255, 255), TEXT_ALIGN_CENTER)
end

hook.Add("HUDPaint", "FTP_MainHUD", DrawFTPHUD)

local hide = {
	["CHudHealth"] = false,
	["CHudBattery"] = false,
}

hook.Add("HUDShouldDraw", "FTP_HideStuff", function(name)
	if (hide[name]) then return false end
end)
