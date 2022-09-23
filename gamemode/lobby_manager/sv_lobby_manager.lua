util.AddNetworkString("open_lobby")
util.AddNetworkString("ready_up")

local ready_players = {}

function enterLobby(ply)

    net.Start("open_lobby")
    net.Send(ply)

end

function checkRoundStart()

    local ready = true
    for _, p in pairs(player.GetAll()) do

        if not (ready_players[p:UserID()]) then 
            ready = false
            break
        end

    end
    
    if (ready) then

        timer.Simple(3, function()
        
            broadcastMessage("Match starting in 5 seconds...")

        end)
        timer.Simple(8, function()

            assignTeams()
            broadcastMessage("TEAM_MESSAGE")
            beginRound()

        end)

    else

        timer.Simple(3, function()
        
            broadcastMessage("Waiting for more players...")

        end)

    end

end

net.Receive("ready_up", function(len, ply)

    if ( IsValid( ply ) and ply:IsPlayer() ) then
        local m = ply:GetName().." has joined."
        broadcastMessage(m)

        ready_players[ply:UserID()] = true

        checkRoundStart()
    else

        print("Ready up fail.")

    end

end)

hook.Add("PlayerInitialSpawn", "open_player_lobby", enterLobby)