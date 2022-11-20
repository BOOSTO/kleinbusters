map_data = {}

map_data.spawns = {
    [KB_TEAM_KLEINER] = { Vector(-4556.789063, -1641.025024, -63.968750), Angle() },
    [KB_TEAM_DEFENDER] = { Vector(-3884.121094, -1711.397949, -319.968750), Angle() },
    [KB_TEAM_BUSTER] = { Vector(4884.848145, 3209.219238, -259.968750), Angle() }
}

map_data.npc_squads = {
    -- { "metrocop", Vector(-420, 830, -12220), Angle() },
    -- { "combine", Vector(670, 630, -12220), Angle() },
    // under bridge near kleiner lab exit
    { "rebel", Vector(-3192.260254, -1879.284912, -319.569305), Angle() },
    // near ladder to roof along street
    { "rebel", Vector(552.217712, -1181.050659, -248.423737), Angle() },
    // on roof near ladder
    { "rebel", Vector(96.284119, -715.184875, 344.619904), Angle() },
    // on roof
    { "civilian", Vector(-387.176819, -876.474792, 440.777618), Angle() },
    // in room with window exit to roof
    { "civilian", Vector(-2367.284668, -1291.379883, 272.031250), Angle() },
    // dumpsters above train tracks
    { "civilian", Vector(-908.571838, 1023.297485, 64.031250), Angle() },
    // guarding civs / railroad ladder
    { "rebel", Vector(-1947.800293, 894.825684, 64.031250), Angle() },
    // in upper park
    { "civilian", Vector(-2774.337158, 577.906006, 64.031250), Angle() },
    // guarding bridge intersection
    { "rebel", Vector(-3306.497559, -196.877518, 192.031250), Angle() },
    // under the bridge near ladder close to kliener lab exit
    { "civilian", Vector(-3345.622559 -2257.525879 -191.968750), Angle() },
    // alleyway intersection
    { "metrocop", Vector(3080.258545, -491.814880, -255.968750), Angle() },
    // security checkpoint
    { "metrocop", Vector(12.000, 161.536, 0.000), Angle() },
    // pre security checkpoint
    { "metrocop", Vector(112.984489, 3231.332764, -287.968750), Angle() },
    // trainstation center
    { "metrocop", Vector(1514.865112, 1969.354248, -287.968750), Angle() }
}

map_data.npcs = {
    -- {
    --     "npc_metropolice",
    --     "weapon_pistol",
    --     Vector(140.0, 880.0, -12220.0),
    --     Angle(0.000, -90.0, 0.000)
    -- }
    // near ladder to roof
    {
        "npc_citizen",
        nil,
        Vector(462.326874, -706.832886, -206.963745),
        Angle(0, 52.975, 0.000)
    },
    {
        "npc_citizen",
        nil,
        Vector(521.845032, -611.315613, -204.819550),
        Angle(0, -143.609, 0.000)
    },
    {
        "npc_citizen",
        nil,
        Vector(527.968750, -778.760742, -210.070435),
        Angle(0, -179.249, 0.000)
    },
    // on roof closer to window entrance
    {
        "npc_citizen",
        nil,
        Vector(-1218.820435, -1457.113525, 264.032806),
        Angle(0, -63.592, 0.000)
    },
    {
        "npc_citizen",
        nil,
        Vector(-1125.342896, -1444.142090, 264.032288),
        Angle(0, -121.841, 0.000)
    },
    {
        "Rebel",
        "weapon_pistol",
        Vector(-1161.321167, -1524.547852, 264.031982),
        Angle(0, -90.292, 0.000)
    },
    // Road lookers
    {
        "Rebel",
        "weapon_smg1",
        Vector(-237.385681, -1250.295776, 419.538208),
        Angle(0, -108.004, 0.000)
    },
    {
        "Rebel",
        "weapon_pistol",
        Vector(424.031250, -1120.742920, 256.037170),
        Angle(10.724, -23.392, 0.000)
    },
    // watching roof pathway
    {
        "Rebel",
        "weapon_pistol",
        Vector(-1795.106079, -1639.286743, 264.032898),
        Angle(0, -9.304, 0.000)
    },
    // trainstation plaza exit
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(1798.675659, 3083.250244, -223.968750),
        Angle(0, 161.536, 0.000)
    },
    // pickup can
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(2997.986816, 3050.860107, -191.968750),
        Angle(7.545, 151.371, 0.000)
    },
    // courtyard heli
    {
        "npc_helicopter",
        nil,
        Vector(5411.126465, 3084.428467, 480.031219),
        Angle(0, 151.371, 0.000)
    }
}

map_data.vehicles = {
    // defender spawn
    { "sim_fphys_pwhatchback", Vector( -3318.04, -1535.54, -380 ), Angle( -0, 193.13, 0 ) },
    // combine spawn
    { "sim_fphys_combineapc", Vector( 4535.56, 1634.9, -310 ), Angle( 0.53, 90.41, 0 ) },
    // end of road
    { "sim_fphys_pwavia", Vector( 5252.46, -1015.72, -310 ), Angle( 0, -0.35, 0 ) },
    // middle road
    { "sim_fphys_pwvan", Vector( 1389.37, -1347.35, -310 ), Angle( -0.15, 170.25, -2.59 ) },
    // top road over def spawn
    { "sim_fphys_v8elite", Vector( -3290.35, -2270.88, 130 ), Angle( 0, 15.84, -0.72 ) },
    // top road parking
    { "sim_fphys_pwtrabant", Vector( -1533.94, -194.04, 10 ), Angle( -0.01, 108.28, -0.03 ) }
}

map_data.item_spawns = {
    -- Vector(256.063019, -833.227539, -12223.968750),
}