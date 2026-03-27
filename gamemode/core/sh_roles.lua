FTTR.Roles = {
    INNOCENT = 1,
    TRAITOR = 2
}

function FTTR.GetTraitorCount(plyCount)
    if plyCount >= 20 then return 3 end
    if plyCount >= 10 then return 2 end
    if plyCount >= 4 then return 1 end
    return 0
end
