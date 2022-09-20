KB__IDLE = 0
KB__START = 1
KB__END = 2

local round_status = KB__IDLE

util.AddNetworkString("UpdateRoundStatus")

function beginRound()

    round_status = KB__START
    updateClientRoundStatus()

end

function endRound()

    round_status = KB__END
    updateClientRoundStatus()

end

function getRoundStatus()

    return round_status

end

function updateClientRoundStatus()

    net.Start("UpdateRoundStatus")
        net.WriteInt(round_status, 4)
    net.Broadcast()

end