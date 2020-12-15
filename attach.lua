if not SGO then return end
get_global_value = function( data )
    if data.global_value then
        return data.global_value
    elseif data.infamous then
        return "infamous"
    elseif data.dlcs or data.dlc then
        local dlcs = data.dlcs or {}
       
        if data.dlc then
            table.insert( dlcs, data.dlc )
        end
       
        return dlcs[ math.random( #dlcs ) ]
    else
        return "normal"
    end
end
 
local types = { "weapon_mods" }
for _, item_type in pairs( types ) do
    for id, data in pairs( tweak_data.blackmarket[ item_type ] ) do
        if data.infamy_lock then
            data.infamy_lock = false
        end
       
        local global_value = get_global_value( data )
        managers.blackmarket:add_to_inventory( global_value, item_type, id )
    end
end
 
local weapons = Global.blackmarket_manager.weapons
for weapon_id in pairs( weapons ) do
    managers.upgrades:aquire( weapon_id )
    weapons[ weapon_id ].unlocked = true
end