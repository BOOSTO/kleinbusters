local anti_kleiners = {
    [CLASS_COMBINE] = true,
    [CLASS_COMBINE_GUNSHIP] = true,
    [CLASS_MANHACK] = true,
    [CLASS_METROPOLICE] = true,
    [CLASS_MILITARY] = true,
    [CLASS_SCANNER] = true
}

local kleiner_ally = {
    [CLASS_CITIZEN_REBEL] = true
}

local pro_kleiners = {
    [CLASS_CITIZEN_PASSIVE] = true
}

function configureNPCRelations(npc)

    if (npc:IsNPC()) then
        
        if (anti_kleiners[npc:Classify()] ~= nil) then

            print("config anti_kleiner")
            
            for _, p in pairs(getTeamMems(KB_TEAM_KLEINER)) do
                
                npc:AddEntityRelationship(p, D_HT, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_DEFENDER)) do
                
                npc:AddEntityRelationship(p, D_HT, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_BUSTER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)

            end

        elseif (kleiner_ally[npc:Classify()] ~= nil) then

            print("config kleiner_ally")
            
            for _, p in pairs(getTeamMems(KB_TEAM_KLEINER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)
            end
            for _, p in pairs(getTeamMems(KB_TEAM_DEFENDER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_BUSTER)) do
                
                npc:AddEntityRelationship(p, D_HT, 99)

            end

        elseif (pro_kleiners[npc:Classify()] ~= nil) then
            
            print("config pro_kleiner")

            for _, p in pairs(getTeamMems(KB_TEAM_KLEINER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)
            end
            for _, p in pairs(getTeamMems(KB_TEAM_DEFENDER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_BUSTER)) do
                
                npc:AddEntityRelationship(p, D_FR, 99)

            end

        end

    end

end

function configureAllNPCRelations()

    for _, e in pairs(ents.GetAll()) do
        
        if (e:IsNPC()) then
            
            configureNPCRelations(e)

        end

    end

end

function spawnNPC(npc_type, wpn, pos, rot)

    e = ents.Create(npc_type)
    if (wpn) then e:Give(wpn) end
    e:SetPos(pos)
	e:SetAngles(rot)
    e:Spawn()
    e:Activate()

end

function spawnCombineSquad(position, rotation)

    squad_size = math.random(4, 8)
    angle = 360.0 / squad_size
    radius = 100.0
    for i=0,squad_size-1 do
        
        npc_angle = angle * i
        x = math.sin(math.rad(npc_angle))
        y = math.cos(math.rad(npc_angle))
        z = 40.0
        direction = Vector(x, y, z)
        offset = direction * Vector(radius, radius, 1)

        npc_rotation = offset:GetNormalized()
        npc_rotation = Angle(npc_rotation.x, npc_rotation.y, 0)

        print("spawning squad[", tostring(i), "]: ", offset, ", ", npc_rotation)
        
        spawnNPC("npc_combine_s", "weapon_smg1", position + offset, npc_rotation)

    end

end

hook.Add ( "OnEntityCreated", "AddCustomRelationships", configureNPCRelations)