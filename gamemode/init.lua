AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- Include other scripts
AddCSLuaFile("team_setup/common/team_setup.lua")
include("team_setup/common/team_setup.lua")
AddCSLuaFile("team_setup/cl_team_setup.lua")
include("team_setup/sv_team_setup.lua")
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")
AddCSLuaFile("lobby_manager/cl_lobby_manager.lua")
include("lobby_manager/sv_lobby_manager.lua")
include("npc_utils.lua")
include("map_utils.lua")

if ( game.GetMap() == "gm_boreas" ) then
    
    include("map_classes/boreas.lua")

elseif  ( game.GetMap() == "gm_city17_trainstation" ) then
    
    include("map_classes/city17_trainstation.lua")


elseif ( game.GetMap() == "gm_flatgrass" ) then

    include("map_classes/flatgrass.lua")

end

function shuffleTable(x)
	for i = #x, 2, -1 do
		local j = math.random(i)
		x[i], x[j] = x[j], x[i]
	end
    return x
end

function GM:PlayerConnect(name, ip)

    print("Player "..name.." connected with IP ("..ip..")")

end

function GM:PlayerInitialSpawn(ply)

    print("Player "..ply:Name().."has spawned.")
    ply:SetTeam(TEAM_SPECTATOR)

end

hook.Add( "GetFallDamage", "CSSFallDamage", function( ply, speed )

	return math.max( 0, math.ceil( 0.2418 * speed - 141.75 ) )

end )