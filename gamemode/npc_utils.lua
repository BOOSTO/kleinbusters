local anti_kleiners = {
    [CLASS_COMBINE] = true,
    [CLASS_COMBINE_GUNSHIP] = true,
    [CLASS_MANHACK] = true,
    [CLASS_METROPOLICE] = true,
    [CLASS_MILITARY] = true,
    [CLASS_SCANNER] = true
}

local kleiner_ally = {
    [CLASS_PLAYER_ALLY] = true
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

local squad_table = {
    ["metrocop"] = {
        {"npc_metropolice", "weapon_sunstick"},
        {"npc_metropolice", "weapon_sunstick"},
        {"npc_metropolice", "weapon_pistol"},
        {"npc_metropolice", "weapon_pistol"},
        {"npc_metropolice", "weapon_pistol"},
        {"npc_metropolice", "weapon_pistol"},
        {"npc_metropolice", "weapon_smg1"},
        {"npc_metropolice", "weapon_smg1"}
    },
	["combine"] = {
        {"npc_combine_s", "weapon_ar2"},
    	{"npc_combine_s", "weapon_smg1"},
    	{"npc_combine_s", "weapon_smg1"},
    	{"npc_combine_s", "weapon_smg1"},
    	{"npc_combine_s", "weapon_smg1"},
    	{"CombinePrison", "weapon_shotgun"},
    	{"CombinePrison", "weapon_shotgun"},
    	{"CombineElite", "weapon_ar2"}
    },
	["rebel"] = {
        {"Medic", "weapon_smg1"},
    	{"Rebel", "weapon_smg1"},
    	{"Rebel", "weapon_smg1"},
    	{"Rebel", "weapon_smg1"},
    	{"Rebel", "weapon_pistol"},
    	{"Rebel", "weapon_pistol"},
    	{"Refugee", "weapon_pistol"},
    	{"Refugee", "weapon_pistol"}
    },
	["civilian"] = {
        {"npc_citizen", "weapon_smg1"},
    	{"npc_citizen", nil},
    	{"npc_citizen", nil},
    	{"npc_citizen", nil},
    	{"npc_citizen", nil},
    	{"Refugee", nil},
    	{"Refugee", nil},
    	{"Refugee", nil}
    }
}

function configurePlayerNPCRelations(ply)

    for _, e in pairs(ents.GetAll()) do
        
        if (e:IsNPC()) then

            local npc = e

            if (ply:Team() == TEAM_SPECTATOR) then

                npc:AddEntityRelationship(ply, D_NU, 99)

            elseif (anti_kleiners[npc:Classify()] ~= nil) then

                if (ply:Team() == KB_TEAM_KLEINER) then
                    npc:AddEntityRelationship(ply, D_HT, 1)
                elseif (ply:Team() == KB_TEAM_DEFENDER) then
                    npc:AddEntityRelationship(ply, D_HT, 1)
                elseif (ply:Team() == KB_TEAM_BUSTER) then
                    npc:AddEntityRelationship(ply, D_LI, 1)
                end
    
            elseif (kleiner_ally[npc:Classify()] ~= nil) then
    
                if (ply:Team() == KB_TEAM_KLEINER) then
                    npc:AddEntityRelationship(ply, D_LI, 1)
                elseif (ply:Team() == KB_TEAM_DEFENDER) then
                    npc:AddEntityRelationship(ply, D_LI, 1)
                elseif (ply:Team() == KB_TEAM_BUSTER) then
                    npc:AddEntityRelationship(ply, D_HT, 1)
                end
    
            elseif (pro_kleiners[npc:Classify()] ~= nil) then
                
                if (ply:Team() == KB_TEAM_KLEINER) then
                    npc:AddEntityRelationship(ply, D_LI, 1)
                elseif (ply:Team() == KB_TEAM_DEFENDER) then
                    npc:AddEntityRelationship(ply, D_LI, 1)
                elseif (ply:Team() == KB_TEAM_BUSTER) then
                    npc:AddEntityRelationship(ply, D_FR, 1)
                end
    
            end

        end

    end

end

function configureNPCRelations(npc)

    for _, ply in pairs(player.GetAll()) do
        
        configurePlayerNPCRelations(ply)

    end
    
end

local function InternalSpawnNPC( Position, Normal, Rotation, Class, Equipment, SpawnFlagsSaved, NoDropToFloor )

	local NPCList = list.Get( "NPC" )
	local NPCData = NPCList[ Class ]

	-- Don't let them spawn this entity if it isn't in our NPC Spawn list.
	-- We don't want them spawning any entity they like!
	if ( !NPCData ) then
		return
	end

	local bDropToFloor = false

	--
	-- This NPC has to be spawned on a ceiling ( Barnacle )
	--
	if ( NPCData.OnCeiling ) then
		if ( Vector( 0, 0, -1 ):Dot( Normal ) < 0.95 ) then
			return nil
		end

	--
	-- This NPC has to be spawned on a floor ( Turrets )
	--
	elseif ( NPCData.OnFloor && Vector( 0, 0, 1 ):Dot( Normal ) < 0.95 ) then
		return nil
	else
		bDropToFloor = true
	end

	if ( NPCData.NoDrop or NoDropToFloor ) then bDropToFloor = false end

	-- Create NPC
	local NPC = ents.Create( NPCData.Class )
	if ( !IsValid( NPC ) ) then return end

	--
	-- Offset the position
	--
	local Offset = NPCData.Offset or 32
	NPC:SetPos( Position + Normal * Offset )

	-- Rotate to face player (expected behaviour)
	local Angles = Rotation

	Angles.pitch = 0
	Angles.roll = 0

	if ( NPCData.Rotate ) then Angles = Angles + NPCData.Rotate end

	NPC:SetAngles( Angles )

	--
	-- This NPC has a special model we want to define
	--
	if ( NPCData.Model ) then
		NPC:SetModel( NPCData.Model )
	end

	--
	-- This NPC has a special texture we want to define
	--
	if ( NPCData.Material ) then
		NPC:SetMaterial( NPCData.Material )
	end

	--
	-- Spawn Flags
	--
	local SpawnFlags = bit.bor( SF_NPC_FADE_CORPSE, SF_NPC_ALWAYSTHINK )
	if ( NPCData.SpawnFlags ) then SpawnFlags = bit.bor( SpawnFlags, NPCData.SpawnFlags ) end
	if ( NPCData.TotalSpawnFlags ) then SpawnFlags = NPCData.TotalSpawnFlags end
	if ( SpawnFlagsSaved ) then SpawnFlags = SpawnFlagsSaved end
	NPC:SetKeyValue( "spawnflags", SpawnFlags )
	NPC.SpawnFlags = SpawnFlags

	--
	-- Optional Key Values
	--
	if ( NPCData.KeyValues ) then
		for k, v in pairs( NPCData.KeyValues ) do
			NPC:SetKeyValue( k, v )
		end
	end

	--
	-- This NPC has a special skin we want to define
	--
	if ( NPCData.Skin ) then
		NPC:SetSkin( NPCData.Skin )
	end

	--
	-- What weapon should this mother be carrying
	--

	-- Check if this is a valid entity from the list, or the user is trying to fool us.
	local valid = false
	for _, v in pairs( list.Get( "NPCUsableWeapons" ) ) do
		if v.class == Equipment then valid = true break end
	end
	for _, v in pairs( NPCData.Weapons or {} ) do
		if v == Equipment then valid = true break end
	end

	if ( Equipment && Equipment != "none" && valid ) then
		NPC:SetKeyValue( "additionalequipment", Equipment )
		NPC.Equipment = Equipment
	end

	NPC:Spawn()
	NPC:Activate()

	-- For those NPCs that set their model in Spawn function
	-- We have to keep the call above for NPCs that want a model set by Spawn() time
	-- BAD: They may adversly affect entity collision bounds
	if ( NPCData.Model && NPC:GetModel():lower() != NPCData.Model:lower() ) then
		NPC:SetModel( NPCData.Model )
	end

	if ( bDropToFloor ) then
		NPC:DropToFloor()
	end

	if ( NPCData.Health ) then
		NPC:SetHealth( NPCData.Health )
	end

	-- Body groups
	if ( NPCData.BodyGroups ) then
		for k, v in pairs( NPCData.BodyGroups ) do
			NPC:SetBodygroup( k, v )
		end
	end

	return NPC

end

function Spawn_NPC( NPCClassName, WeaponName, pos, rot )

	if ( !NPCClassName ) then return end

    local vStart = pos
    local vForward = Vector(0, 0, -1)

    tr = util.TraceLine( {
        start = vStart,
        endpos = vStart + ( vForward * 2048 )
    } )

	-- Create the NPC is you can.
	local SpawnedNPC = InternalSpawnNPC(tr.HitPos, tr.HitNormal, rot, NPCClassName, WeaponName )
	if ( !IsValid( SpawnedNPC ) ) then return end

	-- TryFixPropPosition( ply, SpawnedNPC, tr.HitPos )

	-- See if we can find a nice name for this NPC..
	local NPCList = list.Get( "NPC" )
	local NiceName = nil
	if ( NPCList[ NPCClassName ] ) then
		NiceName = NPCList[ NPCClassName ].Name
	end

end

function Spawn_Squad(sqd_class, position, rotation)

    squad_size = math.random(2, 5)
    angle = 360.0 / squad_size
    radius = 60.0

    local npc_list = shuffleTable(squad_table[sqd_class])

    for i=0,squad_size-1 do
        
        local npc_angle = angle * i
        local x = math.sin(math.rad(npc_angle))
        local y = math.cos(math.rad(npc_angle))
        local z = 0.0
        local direction = Vector(x, y, z)
        local offset = direction * Vector(radius, radius, 1)

        local npc_rotation = offset:Angle()
        local this_npc = npc_list[i+1]

        Spawn_NPC(this_npc[1], this_npc[2], position + offset, npc_rotation)

    end

end

hook.Add ( "OnEntityCreated", "AddCustomRelationships", configureNPCRelations)

hook.Add( "PlayerSpawn", "ConfigNPCRelations", configurePlayerNPCRelations)