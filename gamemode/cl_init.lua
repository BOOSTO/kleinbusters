include("shared.lua")

-- Include other files

include("round_controller/cl_round_controller.lua")
include("lobby_manager/cl_lobby_manager.lua")
include("team_setup/common/team_setup.lua")
include("team_setup/cl_team_setup.lua")

concommand.Add( "kb_npc", function()
    local pos = LocalPlayer():EyePos()
    local rot = LocalPlayer():EyeAngles()
    print("{\n" ..
        "   \"npc_metropolice\",\n" ..
        "   \"weapon_pistol\",\n" ..
        "   Vector(" .. pos.x .. "," .. pos.y .. "," .. pos.z .. "),\n" ..
        "   Angle(" .. rot.x .. "," .. rot.y .. "," .. rot.z .. ")\n" ..
        "}\n"
    )
end, nil, "respawn map entities" )

concommand.Add( "kb_squad", function()
    local pos = LocalPlayer():EyePos()
    local rot = LocalPlayer():EyeAngles()
    print("{ \"metrocop\", " .. 
        "Vector(" .. pos.x .. "," .. pos.y .. "," .. pos.z .. "), " ..
        "Angle(" .. rot.x .. "," .. rot.y .. "," .. rot.z .. ") }\n"
    )
end, nil, "respawn map entities" )

concommand.Add( "kb_item", function()
    local pos = LocalPlayer():EyePos()
    print("Vector(" .. pos.x .. "," .. pos.y .. "," .. pos.z .. ")\n")
end, nil, "respawn map entities" )