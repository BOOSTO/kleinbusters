local anti_kleiners = {
    CLASS_COMBINE = true,
    CLASS_COMBINE_GUNSHIP = true,
    CLASS_MANHACK = true,
    CLASS_METROPOLICE = true,
    CLASS_MILITARY = true,
    CLASS_SCANNER = true
}

local kleiner_ally = {
    CLASS_CITIZEN_REBEL = true
}

local pro_kleiners = {
    CLASS_CITIZEN_PASSIVE = true
}

function configureNPCRelations(npc)

    if (npc:IsNPC()) then

        print("config npc")
        
        if (anti_kleiners[npc:Classify()] != nil) then
            
            for _, p in pairs(getTeamMems(KB_TEAM_KLEINER) + getTeamMems(KB_TEAM_DEFENDER)) do
                
                npc:AddEntityRelationship(p, D_HT, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_BUSTER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)

            end

        elseif (kleiner_ally[npc:Classify()] != nil) then
            
            for _, p in pairs(getTeamMems(KB_TEAM_KLEINER) + getTeamMems(KB_TEAM_DEFENDER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_BUSTER)) do
                
                npc:AddEntityRelationship(p, D_HT, 99)

            end

        elseif (pro_kleiners[npc:Classify()] != nil) then
            
            for _, p in pairs(getTeamMems(KB_TEAM_KLEINER) + getTeamMems(KB_TEAM_DEFENDER)) do
                
                npc:AddEntityRelationship(p, D_LI, 99)

            end
            for _, p in pairs(getTeamMems(KB_TEAM_BUSTER)) do
                
                npc:AddEntityRelationship(p, D_FR, 99)

            end

        end

    end

end

hook.Add ( "OnEntityCreated", "AddCustomRelationships", configureNPCRelations)