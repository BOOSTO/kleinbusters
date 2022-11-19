KLEINER_SPAWN = {Vector(-4531.995117, -1635.286499, -127.968750), Angle(0, 0, 0)}
DEFENDER_SPAWN = {Vector(-3927.934570, -1685.347534, -383.968750), Angle(0, 0, 0)}
BUSTER_SPAWN = {Vector(5406.463867, 2229.149414, -323.968750), Angle(0, 180, 0)}

function mapInitialize()

    print("Initializing map...")
    teamsToSpawns(KLEINER_SPAWN, DEFENDER_SPAWN, BUSTER_SPAWN)

    // Specific singular npcs
    spawnNPC("npc_strider", nil, Vector(5253.250488, -1374.328735, -323.968750), Angle(0, 180, 0))
    spawnNPC("npc_metropolice", "weapon_stunstick", Vector(3022.870605, 3086.709717, -255.968750), Angle())

    spawnCombineSquad(Vector(4224.448730, 1485.802856, -323.968750), Angle())

end