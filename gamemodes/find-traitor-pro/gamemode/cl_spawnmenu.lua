
local function HideSpawnTabs(name)
    
    local tabsToHide = {
        ["#spawnmenu.category.npcs"] = true,
        ["#spawnmenu.category.entities"] = true,
        ["#spawnmenu.category.weapons"] = true,
        ["#spawnmenu.category.vehicles"] = true,
        ["#spawnmenu.category.postprocess"] = true,
    }

    if tabsToHide[name] and not LocalPlayer():IsAdmin() then
        return false 
    end
end
hook.Add("SpawnMenuOpenable", "FTP_LimitTabs", HideSpawnTabs)

function GM:SpawnMenuOpen()
    if LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() then
        return true 
    else
        return false 
    end
end

function GM:ContextMenuOpen()
    return LocalPlayer():IsAdmin()
end

print("[FTP] Spawnmenu-Berechtigungen geladen!")
