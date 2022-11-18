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

if ( game.GetMap() == "gm_boreas" ) then
    
    include("map_classes/boreas.lua")

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