KB_IDLE = 0
KB_START = 1
KB_END = 2

local round_status = KB_IDLE

net.Receive("set_round_status", function(len)

    round_status = net.ReadInt(4)
    displayRoundStatus()
    print("-- round_status: "..round_status)

end)

net.Receive("display_team_message", function()

    displayRoundStatus()
    
end)

function displayRoundStatus()
    if (round_status == KB_IDLE) then
        LocalPlayer():PrintMessage(HUD_PRINTCENTER, "Pre-match Lobby")
    elseif (round_status == KB_START) then
        local ply_team = LocalPlayer():Team()
        if (ply_team == KB_TEAM_KLEINER) then
            LocalPlayer():PrintMessage(HUD_PRINTCENTER, "Dr. Kleiner, the Kleinbusters are after you!")
        elseif (ply_team == KB_TEAM_DEFENDER) then
            LocalPlayer():PrintMessage(HUD_PRINTCENTER, "Protect Dr. Kleiner at all costs!")
        elseif (ply_team == KB_TEAM_BUSTER) then
            LocalPlayer():PrintMessage(HUD_PRINTCENTER, "Kill Dr. Kleiner at all costs!")
        end
    end
end

function getRoundStatus()

    return round_status

end

print("CLIENT: Round Controller")