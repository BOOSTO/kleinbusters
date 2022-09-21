KB_IDLE = 0
KB_START = 1
KB_END = 2

local round_status = KB_IDLE

net.Receive("set_round_status", function(len)

    round_status = net.ReadInt(4)
    print("-- round_status: "..round_status)

end)

function getRoundStatus()

    return round_status

end

print("CLIENT: Round Controller")