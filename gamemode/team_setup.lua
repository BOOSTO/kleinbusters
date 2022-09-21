KB_TEAM_KLEINER = 0
KB_TEAM_DEFENDER = 1
KB_TEAM_BUSTER = 2

local ply = FindMetaTable("Player")
local teams = {}
teams[KB_TEAM_KLEINER] = {
    name = "Kleiner",
    color = Vector(1, 1, 1),
    model = "models/player/kleiner.mdl",
    weapons = {
        {
            name = "weapon_357",
            ammo = "357",
            amnt = 18
        }
    },
    health = 150
}
teams[KB_TEAM_DEFENDER] = {
    name = "Anti-Kleinbusters",
    color = Vector(1, 1, 1),
    model = "models/player/barney.mdl",
    weapons = {
        {
            name = "weapon_pistol",
            ammo = "Pistol",
            amnt = 54
        },
        {
            name = "weapon_smg1",
            ammo = "SMG1",
            amnt = 135
        }
    },
    health = 100
}
teams[KB_TEAM_BUSTER] = {
    name = "Kleinbusters",
    color = Vector(1, 0, 0),
    model = "models/player/combine_super_soldier.mdl",
    weapons = {
        {
            name = "weapon_pistol",
            ammo = "Pistol",
            amnt = 72
        },
        {
            name = "weapon_ar2",
            ammo = "AR2",
            amnt = 210
        }
    },
    health = 125
}

team.SetUp(KB_TEAM_KLEINER, teams[KB_TEAM_KLEINER].name, teams[KB_TEAM_KLEINER].color)
team.SetUp(KB_TEAM_DEFENDER, teams[KB_TEAM_DEFENDER].name, teams[KB_TEAM_DEFENDER].color)
team.SetUp(KB_TEAM_BUSTER, teams[KB_TEAM_BUSTER].name, teams[KB_TEAM_BUSTER].color)

function ply:SetupTeam(n)

    if (not teams[n]) then return end

    self:SetPlayerColor(teams[n].color)
    self:SetModel(teams[n].model)
    self:SetHealth(teams[n].health)
    self:SetWalkSpeed(150)
    self:SetRunSpeed(250)
    self:SetTeam(n)

    for k, weapon in pairs(teams[n].weapons) do
        
        self:Give(weapon.name, true)
        self:GiveAmmo(weapon.amnt, weapon.ammo, true)

    end

end