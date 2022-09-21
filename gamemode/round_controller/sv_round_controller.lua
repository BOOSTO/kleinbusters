KB_IDLE = 0
KB_START = 1
KB_END = 2

local round_status = KB_IDLE

util.AddNetworkString("set_round_status")

function beginRound()

    round_status = KB_START
    updateClientRoundStatus()

end

function endRound()

    round_status = KB_END
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