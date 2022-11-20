map_utils = {}

function map_utils.spawnNPCs()
    if ( map_data.npcs ) then
        for _, npc_struct in pairs(map_data.npcs) do
            Spawn_NPC(npc_struct[1], npc_struct[2], npc_struct[3], npc_struct[4])
        end
    end
    if ( map_data.npc_squads ) then
        for _, squad_struct in pairs(map_data.npc_squads) do
            Spawn_Squad(squad_struct[1], squad_struct[2], squad_struct[3])
        end
    end
end

function map_utils.spawnPlayers()
    teamsToSpawns(map_data.spawns[KB_TEAM_KLEINER], map_data.spawns[KB_TEAM_DEFENDER], map_data.spawns[KB_TEAM_BUSTER])
end

function map_utils.spawnVehicles()
    for _, v in pairs(map_data.vehicles) do
        local e = simfphys.SpawnVehicleSimple( v[1], v[2], v[3] )
        e:DropToFloor()
        e:Activate()
    end
end

function map_utils.spawnItems()
    local default_item = items.item_list[1]
    local item_list = shuffleTable(shallowCopy(items.item_list))

    PrintTable(item_list)

    local idx = 1
    for _, spawnpoint in pairs(map_data.item_spawns) do
        if ( item_list[idx] ) then
            print("spawn item")
            items.spawnItem(item_list[idx], spawnpoint)
            idx = idx + 1
        else
            print("spawn default")
            items.spawnItem(default_item, spawnpoint)
        end
    end
end

function map_utils.createMapEntities()
    map_utils.spawnPlayers()
    map_utils.spawnNPCs()
    map_utils.spawnVehicles()
    map_utils.spawnItems()
end