FTP.Round = {}
FTP.Round.Active = false
FTP.Round.Time = 300 -- 5 Minuten

function FTP.Round:Start()
    self.Active = true
    self.EndTime = CurTime() + self.Time

    PrintMessage(HUD_PRINTTALK, "Runde gestartet!")

    timer.Create("RoundTimer", 1, 0, function()
        if not self.Active then return end

        if CurTime() >= self.EndTime then
            FTP.Round:End("Zeit ist abgelaufen!")
        end
    end)
end

function FTP.Round:End(reason)
    self.Active = false
    timer.Remove("RoundTimer")

    PrintMessage(HUD_PRINTTALK, "Runde beendet: "..reason)

    for _, ply in ipairs(player.GetAll()) do
        ply:StripWeapons()
    end

    FTP.GameStarted = false
end
