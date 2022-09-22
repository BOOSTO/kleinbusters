KB_IDLE = 0
KB_START = 1
KB_END = 2

local round_status = KB_IDLE

util.AddNetworkString("set_round_status")

function broadcastMessage(m)

    local tm = (m == "TEAM_MESSAGE")

    for _, p in pairs(player.GetAll()) do

        if (tm) then

            m = getTeamMessage(p:Team())

        end
        
        p:PrintMessage(HUD_PRINTCENTER, m)

    end

end

function beginRound()

    round_status = KB_START
    updateClientRoundStatus()
    broadcastMessage("TEAM_MESSAGE")

end

function endRound()

    round_status = KB_END
    updateClientRoundStatus()
    broadcastMessage("Kleiner has died!")

end

function getRoundStatus()

    return round_status

end

function updateClientRoundStatus()

    net.Start("set_round_status")
        net.WriteInt(round_status, 4)
    net.Broadcast()

end

hook.Add( "PlayerDeath", "GlobalDeathMessage", function( victim, inflictor, attacker )
   
    if (round_status == KB_START) then

        if (victim:Team() == KB_TEAM_KLEINER) then
            
        victim:SetTeam(TEAM_SPECTATOR)
        endRound()

        elseif (victim:Team() == KB_TEAM_DEFENDER) then
            
            victim:SetTeam(KB_TEAM_BUSTER)

        end

    elseif (round_status == KB_END) then

        victim:SetTeam(TEAM_SPECTATOR)

    end

end )

hook.Add( "PlayerSpawn", "GiveLoadout", function( ply )

    ply:SetupTeam(ply:Team())
    ply:PrintMessage(HUD_PRINTCENTER, getTeamMessage(ply:Team()))

end)