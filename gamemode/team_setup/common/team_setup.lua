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
            name = "weapon_fists",
            ammo = {}
        },
        {
            name = "weapon_357",
            ammo = {
                {
                    name = "357",
                    amnt = 18
                }
            }
        }
    },
    health = 150,
    message = "Dr. Kleiner, the Kleinbusters are after you!"
}
teams[KB_TEAM_DEFENDER] = {
    name = "Anti-Kleinbusters",
    color = Vector(1, 1, 1),
    model = "models/player/barney.mdl",
    weapons = {
        {
            name = "weapon_fists",
            ammo = {}
        },
        {
            name = "weapon_pistol",
            ammo = {
                {
                    name = "Pistol",
                    amnt = 54
                }
            }
        },
        {
            name = "weapon_smg1",
            ammo = {
                {
                    name = "SMG1",
                    amnt = 135
                },
                {
                    name = "SMG1_Grenade",
                    amnt = 3
                }
            }
        }
    },
    health = 100,
    message = "Protect Dr. Kleiner at all costs!"
}
teams[KB_TEAM_BUSTER] = {
    name = "Kleinbusters",
    color = Vector(1, 0, 0),
    model = "models/player/combine_super_soldier.mdl",
    weapons = {
        {
            name = "weapon_fists",
            ammo = {}
        },
        {
            name = "weapon_stunstick",
            ammo = {}
        },
        {
            name = "weapon_pistol",
            ammo = {
                {
                    name = "Pistol",
                    amnt = 72
                }
            }
        },
        {
            name = "weapon_ar2",
            ammo = {
                {
                    name = "AR2",
                    amnt = 210
                },
                {
                    name = "AR2AltFire",
                    amnt = 3
                }
            }
        },
        {
            name = "weapon_frag",
            ammo = {
                {
                    name = "Grenade",
                    amnt = 3
                }
            }
        }
    },
    health = 125,
    message = "Kill Dr. Kleiner at all costs!"
}

function getTeam(n)

    if (not teams[n]) then return NULL end

    return teams[n]

end

function getTeamMessage(n)

    if (not teams[n]) then return "no team message." end

    return teams[n].message

end

function ply:SetupTeam(n)

    self:StripWeapons()
    self:StripAmmo()
    self:SetPlayerColor(Vector(0, 0, 0))

    if (not teams[n]) then return end

    self:SetPlayerColor(teams[n].color)
    self:SetModel(teams[n].model)
    self:SetupHands()
    self:SetHealth(teams[n].health)
    self:SetWalkSpeed(150)
    self:SetRunSpeed(250)
    self:SetTeam(n)

    for _, weapon in pairs(teams[n].weapons) do
        
        self:Give(weapon.name, true)

        for  _, ammo in pairs(weapon.ammo) do

            self:GiveAmmo(ammo.amnt, ammo.name, true)

        end

    end

end