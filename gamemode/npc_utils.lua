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

local combine_squad = {
    {"npc_combine_s", "models/combine_soldier.mdl", "weapon_ar2"},
    {"npc_combine_s", "models/combine_soldier.mdl", "weapon_ar2"},
    {"npc_combine_s", "models/combine_soldier.mdl", "weapon_smg1"},
    {"npc_combine_s", "models/combine_soldier.mdl", "weapon_smg1"},
    {"npc_combine_s", "models/combine_soldier.mdl", "weapon_smg1"},
    {"npc_combine_s", "models/combine_soldier_prisonguard.mdl", "weapon_shotgun"},
    {"npc_combine_s", "models/combine_soldier_prisonguard.mdl", "weapon_shotgun"},
    {"npc_combine_s", "models/combine_super_soldier.mdl", "weapon_ar2"}
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

function spawnCombine(npc_type, mdl, wpn, pos, rot)

    e = ents.Create(npc_type)
    e:SetModel(mdl)
    if (wpn) then e:Give(wpn) end
    e:SetPos(pos)
	e:SetAngles(rot)
    e:Spawn()
    e:Activate()
    e:DropToFloor()

end

function spawnCombineSquad(position, rotation)

    squad_size = math.random(4, 8)
    angle = 360.0 / squad_size
    radius = 100.0

    npc_list = shuffleTable(combine_squad)

    for i=0,squad_size-1 do
        
        npc_angle = angle * i
        x = math.sin(math.rad(npc_angle))
        y = math.cos(math.rad(npc_angle))
        z = 60.0
        direction = Vector(x, y, z)
        offset = direction * Vector(radius, radius, 1)

        local vStart = position + offset
		local vForward = Vector(0, 0, -1)

		tr = util.TraceLine( {
			start = vStart,
			endpos = vStart + ( vForward * 2048 ),
			filter = ply
		} )

        npc_rotation = offset:GetNormalized()
        npc_rotation = Angle(npc_rotation.x, npc_rotation.y, 0)
        
        this_combine = npc_list[i+1]
        spawnCombine(this_combine[1], this_combine[2], this_combine[3], tr.HitPos + tr.HitNormal * 32, npc_rotation)

    end

end

hook.Add ( "OnEntityCreated", "AddCustomRelationships", configureNPCRelations)