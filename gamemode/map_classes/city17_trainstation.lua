KLEINER_SPAWN = {Vector(-4531.995117, -1635.286499, -127.968750), Angle(0, 0, 0)}
DEFENDER_SPAWN = {Vector(-3927.934570, -1685.347534, -383.968750), Angle(0, 0, 0)}
BUSTER_SPAWN = {Vector(5406.463867, 2229.149414, -323.968750), Angle(0, 180, 0)}

function mapInitialize()

    print("Initializing map...")
    teamsToSpawns(KLEINER_SPAWN, DEFENDER_SPAWN, BUSTER_SPAWN)

    // end of road
    spawnNPC("npc_strider", nil, Vector(5253.250488, -1374.328735, -323.968750), Angle(0, 180, 0))
    spawnCombineSquad(Vector(4901.036133, -1410.070801, -323.968750), Angle())
    // middle of the road
    spawnCombineSquad(Vector(1682.599487, -1487.808228, -323.212677), Angle())
    // pickup can
    spawnNPC("npc_metropolice", "weapon_stunstick", Vector(3022.870605, 3086.709717, -255.968750), Angle(0, 135, 0))
    // courtyard
    spawnCombineSquad(Vector(4224.448730, 1485.802856, -323.968750), Angle())
    spawnCombineSquad(Vector(4275.843750, 2910.258545, -323.968750), Angle())
    // train station
    spawnCombineSquad(Vector(1527.702271, 1960.793457, -351.968750), Angle())
    spawnNPC("npc_metropolice", "weapon_pistol", Vector(1823.793945, 1179.278442, -351.968750), Angle(0, 90, 0))
    spawnNPC("npc_metropolice", "weapon_smg1", Vector(828.867004, 1156.160034, -351.968750), Angle(0, 150, 0))
    spawnNPC("npc_metropolice", "weapon_stunstick", Vector(812.377380, 1242.037354, -351.968750), Angle(0, -135, 0))
    spawnNPC("npc_metropolice", "weapon_smg1", Vector(508.050720, 2162.376709, -303.968842), Angle(0, 180, 0))
    spawnNPC("npc_metropolice", "weapon_pistol", Vector(17.456968, 2164.213379, -303.968750), Angle(0, 0, 0))
    spawnNPC("npc_metropolice", "weapon_stunstick", Vector(2154.632568, 1062.713745, -255.968750), Angle(0, 180, 0))
    spawnNPC("npc_metropolice", "weapon_pistol", Vector(2661.983398, 1119.947876, -255.968750), Angle(0, -90, 0))
    // near food court
    spawnCombineSquad(Vector(133.567932, 3232.270996, -351.968750), Angle())
    // pre pick up can
    spawnCombineSquad(Vector(2053.615723, 2731.302002, -255.968750), Angle())
    // dumpsters above tracks
    spawnCombineSquad(Vector(-868.863525, 1058.727051, 0.031250), Angle())
    // railroad overpass
    spawnCombineSquad(Vector(-3362.252441, 1792.862915, 128.031250), Angle())
    // food court
    spawnCombineSquad(Vector(3019.614990, 1589.437744, -255.968750), Angle())
    
end