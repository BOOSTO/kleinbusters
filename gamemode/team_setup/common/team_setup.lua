KB_TEAM_KLEINER = 1
KB_TEAM_DEFENDER = 2
KB_TEAM_BUSTER = 3

local ply = FindMetaTable("Player")
local teams = {}
teams[KB_TEAM_KLEINER] = {
    name = "Kleiner",
    color = Color(255, 255, 255),
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
    color = Color(0, 0, 255),
    model = "REBEL",
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
    color = Color(255, 0, 0),
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

function shuffleTable(x)
	for i = #x, 2, -1 do
		local j = math.random(i)
		x[i], x[j] = x[j], x[i]
	end
    return x
end

function assignTeams()

    local i = 1
    for _, p in pairs(shuffleTable(player.GetAll())) do

        if (i == 1) then
            p:SetupTeam(KB_TEAM_KLEINER)
        elseif (i == 2) then
            p:SetupTeam(KB_TEAM_BUSTER)
        elseif (i == 2) then
            p:SetupTeam(KB_TEAM_DEFENDER)
        else
            -- DEF = 2
            -- BUS = 3
            local tm = ( i + 1 ) % 2 + 2
            p:SetupTeam(tm)
        end

        i = i + 1

    end

end

function getTeamMems(team_id)

    plys = {}
    for _, ply in pairs(player.GetAll()) do
        
        if ( ply:Team() == team_id ) then
            plys[#plys+1] = ply
        end

    end

    return plys

end

function ply:SetupTeam(n)

    self:StripWeapons()
    self:StripAmmo()
    self:SetPlayerColor(Vector(0, 0, 0))

    if (not teams[n]) then return end

    self:SetTeam(n)
    self:SetPlayerColor(team.GetColor(n):ToVector())
    if (teams[n].model == "REBEL") then
        self:SetModel("models/player/Group03/male_0"..math.random(1, 9)..".mdl")
    else
        self:SetModel(teams[n].model)
    end
    self:SetupHands()
    self:SetHealth(teams[n].health)
    self:SetWalkSpeed(150)
    self:SetRunSpeed(250)
    self:ShouldDropWeapon(true)

    for _, weapon in pairs(teams[n].weapons) do
        
        self:Give(weapon.name, true)

        for  _, ammo in pairs(weapon.ammo) do

            self:GiveAmmo(ammo.amnt, ammo.name, true)

        end

    end

end

-- Set up teams
for _, v in pairs({
    KB_TEAM_KLEINER,
    KB_TEAM_DEFENDER,
    KB_TEAM_BUSTER
}) do
    
    local tm = getTeam(v)
    team.SetUp(v, tm.name, tm.color)

end