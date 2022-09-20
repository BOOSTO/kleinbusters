util.AddNetworkString("open_lobby")
util.AddNetworkString("ready_up")

function enterLobby()

    net.Start("open_lobby")
    net.Broadcast()

end

net.Receive("ready_up", function()

    beginRound()

end)

hook.Add("PlayerInitialSpawn", "open_player_lobby", enterLobby)