KB__IDLE = 0
KB__START = 1
KB__END = 2

local round_status = KB__IDLE

util.AddNetworkString("set_round_status")

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

    net.Start("set_round_status")
        net.WriteInt(round_status, 4)
    net.Broadcast()

end