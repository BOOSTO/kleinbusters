map_data = {}

map_data.spawns = {
    [KB_TEAM_KLEINER] = { Vector(-953.067566, -46.323975, -12703.968750), Angle() },
    [KB_TEAM_DEFENDER] = { Vector(-697.078979, -45.058884, -12703.968750), Angle() },
    [KB_TEAM_BUSTER] = { Vector(32.262192, 28.515976, -12223.968750), Angle() }
}

map_data.npc_squads = {
    { "metrocop", Vector(-420, 830, -12220), Angle() },
    { "combine", Vector(670, 630, -12220), Angle() },
    { "rebel", Vector(-690, -220, -12700), Angle() },
    { "civilian", Vector(-690, 220, -12700), Angle() }
}

map_data.npcs = {
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(140.0, 880.0, -12220.0),
        Angle(0.000, -90.0, 0.000)
    },
    {
        "npc_strider",
        nil,
        Vector(-700, 170, -12220),
        Angle()
    },
    {
        "npc_helicopter",
        nil,
        Vector(-700, -460, -12220),
        Angle()
    }
}

map_data.vehicles = {
    { "sim_fphys_pwhatchback", Vector(660, -710, -12220), Angle(0, 135, 0) }
}

map_data.item_spawns = {
    Vector(256.063019, -833.227539, -12223.968750),
    Vector(150.063019, -833.227539, -12223.968750),
    Vector(50.063019, -833.227539, -12223.968750),
    Vector(-50, -833.227539, -12223.968750),
    Vector(-150, -833.227539, -12223.968750)
}