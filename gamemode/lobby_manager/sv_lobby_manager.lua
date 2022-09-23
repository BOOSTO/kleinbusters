util.AddNetworkString("open_lobby")
util.AddNetworkString("ready_up")

function enterLobby(ply)

    net.Start("open_lobby")
    net.Send(ply)

end

net.Receive("ready_up", function(len, ply)

    if ( IsValid( ply ) and ply:IsPlayer() ) then
        local m = ply:GetName().." has joined."
        broadcastMessage(m)

        -- TODO: check if enough players are ready then start the match.
        timer.Simple( 5, function()
            ply:SetupTeam(math.random(1, 3))
            broadcastMessage("TEAM_MESSAGE")
            beginRound()
        end)
    else
        print("Ready up fail.")
    end

end)

hook.Add("PlayerInitialSpawn", "open_player_lobby", enterLobby)