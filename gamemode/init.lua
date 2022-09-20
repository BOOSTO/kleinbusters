AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- Include other scripts
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")
AddCSLuaFile("lobby_manager/cl_lobby_manager.lua")
include("lobby_manager/sv_lobby_manager.lua")

function GM:PlayerConnect(name, ip)

    print("Player "..name.." connected with IP ("..ip..")")

end

function GM:PlayerInitialSpawn(ply)

    print("Player "..ply:Name().."has spawned.")

end