AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- Include other scripts
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")
AddCSLuaFile("lobby_manager/cl_lobby_manager.lua")
include("lobby_manager/sv_lobby_manager.lua")

local startWeapons = {
    "weapon_pistol",
    "weapon_smg1"
}
local startAmmo = {
    Pistol = 54,
    SMG1 = 135
}
local ply = FindMetaTable("Player")

function ply:GiveLoadout()

    self:SetPlayerColor(Vector(1, 1, 1))
    self:SetModel("models/player/kleiner.mdl")
    for k, weapon in pairs(startWeapons) do
        
        self:Give(weapon, true)

    end
    for ammo, amnt in pairs(startAmmo) do
        
        self:GiveAmmo(amnt, ammo, true)

    end

end

function GM:PlayerConnect(name, ip)

    print("Player "..name.." connected with IP ("..ip..")")

end

function GM:PlayerInitialSpawn(ply)

    print("Player "..ply:Name().."has spawned.")

end