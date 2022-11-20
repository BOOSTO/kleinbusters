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

function map_utils.createMapEntities()
    map_utils.spawnNPCs()
end