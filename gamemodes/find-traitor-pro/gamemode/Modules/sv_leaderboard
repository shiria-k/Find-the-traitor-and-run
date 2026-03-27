FTP = FTP or {}

util.AddNetworkString("FTP_SendLeaderboard")

function FTP:SendLeaderboard(ply)
    local data = {}

    for _, v in ipairs(player.GetAll()) do
        table.insert(data, {
            name = v:Nick(),
            wins = v:GetNWInt("Wins", 0),
            money = v:GetNWInt("Money", 0)
        })
    end

    table.SortByMember(data, "wins", true)

    net.Start("FTP_SendLeaderboard")
    net.WriteTable(data)
    net.Send(ply)
end

concommand.Add("ftp_leaderboard", function(ply)
    FTP:SendLeaderboard(ply)
  end)
