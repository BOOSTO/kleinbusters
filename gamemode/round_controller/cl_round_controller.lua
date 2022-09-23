KB_IDLE = 0
KB_START = 1
KB_END = 2

local round_status = KB_IDLE

surface.CreateFont( "KBFont", {
    font = "Arial",
    size = 25,
    weight = 100
})

function updateUITeam()

    surface.SetFont("KBFont")
    local msg = team.GetName(LocalPlayer():Team())
    local color = team.GetColor(LocalPlayer():Team())
    local w, h = surface.GetTextSize(msg)
    surface.SetTextPos( ( ScrW() - w ) / 2, h + 10)
    surface.SetTextColor(color)
    surface.DrawText(msg)

end

hook.Add("HUDPaint", "hud_draw_player_ui", updateUITeam)

net.Receive("set_round_status", function(len)

    round_status = net.ReadInt(4)
    print("-- round_status: "..round_status)

end)

function getRoundStatus()

    return round_status

end

print("CLIENT: Round Controller")