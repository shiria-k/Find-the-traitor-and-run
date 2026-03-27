local function IncludeDir(dir, server, client)
    local files, folders = file.Find(dir.."/*", "LUA")
    for _, f in ipairs(files) do
        local path = dir.."/"..f
        if server then include(path) end
        if client then AddCSLuaFile(path) end
    end
end

IncludeDir("gamemodes/find-traitor-pro/gamemode/config", true, true)
IncludeDir("gamemodes/find-traitor-pro/gamemode/core", true, true)
IncludeDir("gamemodes/find-traitor-pro/gamemode/systems", true, true)
IncludeDir("gamemodes/find-traitor-pro/gamemode/player", true, true)
IncludeDir("gamemodes/find-traitor-pro/gamemode/ui", false, true)
IncludeDir("gamemodes/find-traitor-pro/gamemode/hooks", true, true)
IncludeDir("gamemodes/find-traitor-pro/gamemode/libs", true, true)
