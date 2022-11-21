map_data = {}

map_data.spawns = {
    [KB_TEAM_KLEINER] = { Vector(-4556.789063, -1641.025024, -63.968750), Angle() },
    [KB_TEAM_DEFENDER] = { Vector(-3884.121094, -1711.397949, -319.968750), Angle() },
    [KB_TEAM_BUSTER] = { Vector(4884.848145, 3209.219238, -259.968750), Angle() }
}

map_data.npc_squads = {
    // -------------------------------------------
    //            BUSTER SPAWN AREA
    // -------------------------------------------
    // end of road
    { "combine", Vector(4884.904296875,-1373.5355224609,-259.96875), Angle( 0 ,-176.72996520996, 0 ) },
    // junction to apts plaza
    { "metrocop", Vector(3065.806640625,-504.22702026367,-255.96875), Angle( 0 ,-93.680221557617, 0 ) },
    // -------------------------------------------
    //            TRAIN STATION
    // -------------------------------------------
    // center of station pad
    { "metrocop", Vector(1516.537109375,1971.314453125,-287.96875), Angle( 0 ,-179.26950073242, 0 ) },
    // -------------------------------------------
    //            ROOFTOPS
    // -------------------------------------------
    { "civilian", Vector(1118.0655517578,-958.28472900391,464.43566894531), Angle( 0 ,-88.600296020508, 0 ) },
    { "civilian", Vector(-3003.96875,-1468.9814453125,128.03125), Angle( 0 ,-64.513458251953, 0 ) },
    { "metrocop", Vector(-2292.03125,-1458.5891113281,128.03125), Angle( 0 ,2.5064969062805, 0 ) },
}

map_data.npcs = {
    // -------------------------------------------
    //            BUSTER SPAWN AREA
    // -------------------------------------------
    // catwalk
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(3711.6484375,-545.37292480469,-31.96875),
        Angle( 0 ,79.970085144043, 0 )
    },
    // buster courtyard
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(4094.341796875,525.33966064453,-255.96875),
        Angle( 0 ,178.39001464844, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(4512.3403320313,2450.0654296875,-255.96875),
        Angle( 0 ,-178.62471008301, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(4541.7197265625,1789.3924560547,-255.96875),
        Angle( 0 ,-122.19430541992, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(4788.85546875,3420.5817871094,-259.96875),
        Angle( 0 ,-90.104499816895, 0 )
    },
    {
        "npc_breen",
        nil,
        Vector(4847.7817382813,894.17327880859,-255.96875),
        Angle( 0 ,0.9998020529747, 0 )
    },
    {
        "npc_stalker",
        nil,
        Vector(4376.9111328125,342.75183105469,-255.96875),
        Angle( 0 ,-43.410263061523, 0 )
    },
    // main station entrance
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(4094.341796875,525.33966064453,-255.96875),
        Angle( 0 ,178.39001464844, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(3606.6596679688,2107.1430664063,-191.96875),
        Angle( 0 ,-1.4999604225159, 0 )
    },
    // end of road
    {
        "npc_strider",
        nil,
        Vector(5512.6928710938,-1487.7145996094,-259.96875),
        Angle( 0 ,179.74049377441, 0 )
    },
    // overlooking courtyard
    {
        "npc_helicopter",
        nil,
        Vector(5410.0087890625,3070.8991699219,480.03121948242),
        Angle( 0 ,-135.54434204102, 0 )
    },
    // -------------------------------------------
    //            TRAIN STATION
    // -------------------------------------------
    // inside train
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(37.67960357666,2165.3334960938,-239.96875),
        Angle( 0 ,-1.0994650125504, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(504.80804443359,2162.279296875,-239.96875),
        Angle( 0 ,179.87551879883, 0 )
    },
    // end of platform
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(-261.58773803711,1897.8232421875,-287.96875),
        Angle( 0 ,3.325567483902, 0 )
    },
    // near turnstile
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(1408.03125,2704.5451660156,-287.96875),
        Angle( 0 ,-3.2164506912231, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(735.99694824219,2942.1674804688,-287.96875),
        Angle( 0 ,178.45132446289, 0 )
    },
    // queue / security checkpoint
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(698.45208740234,3249.1809082031,-287.96875),
        Angle( 0 ,-179.65370178223, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2166.5827636719,3498.8540039063,-287.96875),
        Angle( 0 ,-179.70880126953, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(1416.2740478516,3117.2646484375,-287.96875),
        Angle( 0 ,-90.564712524414, 0 )
    },
    {
        "PrisonShotgunner",
        "weapon_shotgun",
        Vector(1427.6291503906,3583.96875,-287.96875),
        Angle( 0 ,-90.894630432129, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(1797.6533203125,3100.1472167969,-223.96875),
        Angle( 0 ,169.23616027832, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(2020.3061523438,2938.3898925781,-191.96875),
        Angle( 0 ,-88.023986816406, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2205.8879394531,2819.8559570313,-191.96875),
        Angle( 0 ,-8.5041103363037, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(3157.96875,3232.5952148438,-187.17819213867),
        Angle( 0 ,-1.6216077804565, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(2213.1691894531,3720.5485839844,-287.96875),
        Angle( 0 ,1.2059507369995, 0 )
    },     
    // food recepticle connector
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(3028.8029785156,3052.9184570313,-191.96875),
        Angle( 0 ,162.7658996582, 0 )
    },
    {
        "npc_stalker",
        nil,
        Vector(2776.0927734375,3734.3264160156,-319.96875),
        Angle( 0 ,-2.369063615799, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(2543.9853515625,3651.0285644531,-319.96875),
        Angle( 0 ,176.77073669434, 0 )
    },
    {
        "npc_gman",
        nil,
        Vector(2358.6149902344,4295.982421875,-319.96875),
        Angle( 0 ,-59.184356689453, 0 )
    },
    // food recepticle zone
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(2768.2023925781,1440.3101806641,-191.96875),
        Angle( 0 ,-91.414260864258, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(3275.291015625,2216.1958007813,-191.96875),
        Angle( 0 ,-179.71467590332, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(2653.2053222656,2131.8366699219,-191.96875),
        Angle( 0 ,15.175861358643, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(3470.6333007813,1471.6882324219,-191.96875),
        Angle( 0 ,-90.21501159668, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(3359.2180175781,1530.3084716797,-191.96875),
        Angle( 0 ,122.21997070313, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2654.9621582031,1758.1900634766,-191.96875),
        Angle( 0 ,-71.248565673828, 0 )
    },
    // -------------------------------------------
    //            APARTMENT PLAZA
    // -------------------------------------------
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2879.2275390625,348.79483032227,-255.96875),
        Angle( 0 ,-88.535247802734, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(1328.6501464844,142.85148620605,-255.96875),
        Angle( 0 ,-0.2452422529459, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(1325.4644775391,243.4080657959,-255.96875),
        Angle( 0 ,-0.57526075839996, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(1361.7896728516,-176.03125,-255.96875),
        Angle( 0 ,-45.15514755249, 0 )
    },
    {
        "npc_metropolice",
        "weapon_sunstick",
        Vector(1639.5306396484,-907.42120361328,-255.96875),
        Angle( 0 ,2.5549018383026, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(1554.1309814453,-1106.4908447266,-255.96875),
        Angle( 0 ,-85.480224609375, 0 )
    }
    // -------------------------------------------
    //            APARTMENT INTERIOR
    // -------------------------------------------
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(1479.9713134766,-778.20251464844,-63.96875),
        Angle( 0 ,90.499435424805, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(3491.9636230469,-895.83764648438,-63.96875),
        Angle( 0 ,86.984283447266, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(3605.7683105469,-886.94250488281,-255.96875),
        Angle( 0 ,165.08428955078, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2111.4150390625,-698.68829345703,128.03125),
        Angle( 0 ,-179.73770141602, 0 )
    },
    {
        "npc_metropolice",
        "weapon_smg1",
        Vector(2179.2934570313,-1078.8675537109,0.03125),
        Angle( 0 ,-92.769256591797, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2407.9997558594,-443.3694152832,0.03125),
        Angle( 0 ,179.19239807129, 0 )
    },
    {
        "npc_metropolice",
        "weapon_pistol",
        Vector(2259.068359375,-128.37133789063,0.03125),
        Angle( 0 ,89.756202697754, 0 )
    },
    // -------------------------------------------
    //            APARTMENT ROOFS
    // -------------------------------------------
    {
        "Medic",
        "weapon_shotgun",
        Vector(1512.4770507813,-850.91973876953,256.03125),
        Angle( 0 ,2.5097641944885, 0 )
    },
    {
        "Rebel",
        "weapon_pistol",
        Vector(642.26892089844,-715.72094726563,448.03125),
        Angle( 0 ,-179.82833862305, 0 )
    }
}

map_data.vehicles = {
    // defender spawn
    { "sim_fphys_pwhatchback", Vector( -3318.04, -1535.54, -370 ), Angle( -0, 193.13, 0 ) },
    // combine spawn
    { "sim_fphys_combineapc", Vector( 4535.56, 1634.9, -310 ), Angle( 0.53, 90.41, 0 ) },
    // end of road
    { "sim_fphys_pwavia", Vector( 5252.46, -1015.72, -310 ), Angle( 0, -0.35, 0 ) },
    // middle road
    { "sim_fphys_pwvan", Vector( 1389.37, -1347.35, -310 ), Angle( -0.15, 170.25, -2.59 ) },
    // top road over def spawn
    { "sim_fphys_v8elite", Vector( -3290.35, -2270.88, 130 ), Angle( 0, 15.84, -0.72 ) },
    // top road parking
    { "sim_fphys_pwhatchback", Vector( -1533.94, -194.04, 60 ), Angle( -0.01, 108.28, -0.03 ) }
}

map_data.item_spawns = {
    // train depot
    Vector(-3345.4860839844,3169.427734375,-383.96875),
    Vector(-3601.6826171875,1203.4791259766,-255.46875),
    Vector(-1798.5184326172,1135.1810302734,-262.03652954102),
    Vector(-1798.5184326172,1135.1810302734,-262.03652954102),
    Vector(-61.953022003174,2160.6923828125,-239.96875),
    Vector(866.40710449219,1773.0556640625,-99.429580688477),
    Vector(791.40533447266,1088.9130859375,-270.1842956543),
    Vector(1637.9553222656,2873.6306152344,-219.05508422852),
    // station lobby
    Vector(606.91064453125,2642.623046875,-257.96875),
    Vector(94.147666931152,3426.3754882813,-257.96875),
    Vector(1290.0283203125,3557.1323242188,-287.96875),
    Vector(2158.4255371094,3672.455078125,-253.73034667969),
    Vector(1926.1818847656,3984.3996582031,-270.22933959961),
    Vector(2369.5903320313,3951.0437011719,-319.97082519531),
    Vector(2991.2626953125,3308.7416992188,-191.96875),
    Vector(2668.0129394531,1778.9422607422,-191.96875),
    Vector(2181.3874511719,1130.4283447266,-191.96875),
    Vector(2503.6569824219,1523.5710449219,-161.96875),
    // buster courtyard
    Vector(4746.8994140625,2221.5969238281,-207.96875),
    Vector(4746.8994140625,2221.5969238281,-207.96875),
    Vector(5209.6513671875,-1016.5034790039,-222.65362548828),
    Vector(5192.1416015625,-2047.6937255859,-255.96875),
    // apartment plaza
    Vector(1273.6915283203,497.43768310547,-191.96875),
    Vector(2558.1674804688,305.68432617188,-255.96875),
    // apartment interior
    Vector(1483.3790283203,-946.90356445313,-255.96875),
    Vector(1748.1352539063,-761.12615966797,0.0312  5),
    Vector(3592.5134277344,-829.80084228516,-255.96875),
    Vector(2115.7048339844,-553.13934326172,20.592147827148),
    // rooftop secret
    Vector(-2847.0146484375,-1141.6198730469,168.45680236816),
    Vector(-2847.0146484375,-1141.6198730469,168.45680236816),
    Vector(-2201.4697265625,-1360.5869140625,312.8203125),
    Vector(-2894.7414550781,-1143.0759277344,312.44915771484),
    // upper area
    Vector(-1521.9553222656,274.93518066406,102.24503326416),
}