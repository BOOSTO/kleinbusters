for _, v in pairs({
    KB_TEAM_KLEINER,
    KB_TEAM_DEFENDER,
    KB_TEAM_BUSTER
}) do
    
    local tm = getTeam(v)
    team.SetUp(v, tm.name, tm.color)

end