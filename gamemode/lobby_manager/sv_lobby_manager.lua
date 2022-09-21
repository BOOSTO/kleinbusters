util.AddNetworkString("open_lobby")
util.AddNetworkString("ready_up")

function enterLobby()

    net.Start("open_lobby")
    net.Broadcast()

end

net.Receive("ready_up", function(len, ply)

    if ( IsValid( ply ) and ply:IsPlayer() ) then
        ply:SetupTeam(math.random(0, 2))
        timer.Simple( 5, beginRound)
    else
        print("Ready up fail.")
    end

end)

hook.Add("PlayerInitialSpawn", "open_player_lobby", enterLobby)