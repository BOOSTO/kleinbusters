items = {}

items.item_list = {
    { "item_healthvial", nil },
    { "item_healthkit", nil },
    { "weapon_crossbow", "item_ammo_crossbow", 1 },
    { "weapon_rpg", "item_rpg_round", 3 },
    { "weapon_frag", nil },
    { "weapon_physcannon", nil },
    { "weapon_357", "item_ammo_357", 2 },
    { "item_ammo_smg1", "item_ammo_smg1_grenade", 3 },
    { "weapon_smg1", "item_ammo_smg1", 1 },
    { "weapon_ar2", "item_ammo_ar2", 1 },
    { "item_ammo_ar2_altfire", "item_ammo_ar2", 1 }
}

function items.spawnItem(it, pos)
    local item = ents.Create(it[1])
    if ( it[2] ) then
        for i=1,it[3] do
            local ammo = ents.Create(it[2])
            ammo:SetPos(pos)
            ammo:DropToFloor()
            ammo:Spawn()
            ammo:Activate()
        end
    end
    item:SetPos(pos)
    item:DropToFloor()
    item:Spawn()
    item:Activate()
end