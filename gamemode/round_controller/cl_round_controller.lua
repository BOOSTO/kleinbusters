KB__IDLE = 0
KB__START = 1
KB__END = 2

local round_status = KB__IDLE

net.Receive("UpdateRoundStatus", function(len)

    round_status = net.ReadInt(4)
    print("-- round_status: "..round_status)

end)

function getRoundStatus()

    return round_status

end

print("CLIENT: Round Controller")