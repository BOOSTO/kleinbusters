KB_IDLE = 0
KB_START = 1
KB_END = 2

local round_status = KB_IDLE

util.AddNetworkString("set_round_status")
util.AddNetworkString("display_team_message")

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
    net.Start("display_team_message")
    net.Broadcast()

end)