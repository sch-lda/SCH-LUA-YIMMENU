--------------------------------------------------------------------------------------- functions

function upgrade_vehicle(vehicle)
    for i = 0, 49 do
        local num = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i)
        VEHICLE.SET_VEHICLE_MOD(vehicle, i, num - 1, true)
    end
end


function attach_to_player(hash, bone, x, y, z, xrot, yrot, zrot)     --附加实体到自己
    local user_ped = PLAYER.PLAYER_PED_ID()
    hash = joaat(hash)

    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do		
        script.yield()
    end
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)

    local object = OBJECT.CREATE_OBJECT(hash, 0.0,0.0,0, true, true, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(object, user_ped, PED.GET_PED_BONE_INDEX(PLAYER.PLAYER_PED_ID(), bone), x, y, z, xrot, yrot, zrot, false, false, false, false, 2, true) 
end


function CreatePed(index, Hash, Pos, Heading)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do script.yield() end
    local SpawnedVehicle = PED.CREATE_PED(index, Hash, Pos.x, Pos.y, Pos.z, Heading, true, true)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    return SpawnedVehicle
end

function CreateObject(Hash, Pos, static)
    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do script.yield() end
    local SpawnedVehicle = create_object(Hash, Pos)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    if static then
        ENTITY.FREEZE_ENTITY_POSITION(SpawnedVehicle, true)
    end
    return SpawnedVehicle
end

function create_object(hash, pos)
   --gui.show_message("Debughash", hash)
   -- gui.show_message("DebugX", pos.x)
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) do script.yield() end
    local obj = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z, true, false, false)
    --STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
    return obj
end

function request_model(hash)
    local end_time = os.time() + 5
    STREAMING.REQUEST_MODEL(hash)
    while not STREAMING.HAS_MODEL_LOADED(hash) and end_time >= os.time() do
        script.yield()
    end
    return STREAMING.HAS_MODEL_LOADED(hash)
end

function Create_Network_Ped(pedType, modelHash, x, y, z, heading)
    request_model(modelHash)
    local ped = PED.CREATE_PED(pedType, modelHash, x, y, z, heading, true, true)

    ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(ped, true)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, true, false)
    ENTITY.SET_ENTITY_SHOULD_FREEZE_WAITING_ON_COLLISION(ped, true)

    NETWORK.NETWORK_REGISTER_ENTITY_AS_NETWORKED(ped)
    local net_id = NETWORK.PED_TO_NET(ped)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(net_id, true)
    NETWORK.SET_NETWORK_ID_CAN_MIGRATE(net_id, true)
    for _, pid in pairs(players.list()) do
        NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(net_id, pid, true)
    end

    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(modelHash)
    return ped
end

function CreateVehicle(Hash, Pos, Heading, Invincible)
    gui.show_message("Debugvehhash", Hash)

    STREAMING.REQUEST_MODEL(Hash)
    while not STREAMING.HAS_MODEL_LOADED(Hash) do script.yield() end
    local SpawnedVehicle = VEHICLE.CREATE_VEHICLE(Hash, Pos.x,Pos.y,Pos.z, Heading , true, true, true)
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(Hash)
    if Invincible then
        ENTITY.SET_ENTITY_INVINCIBLE(SpawnedVehicle, true)
    end
    gui.show_message("Debugvehhash", SpawnedVehicle)

    return SpawnedVehicle
end

--------------------------------------------------------------------------------------- MPx

--gui.show_message("Debugmpx", mpx.."H4_")

--[[
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试6", function()

    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0.0, 0.52, 0.0)
    gui.show_message("DebugX", pos.x)
    create_object(200846641, pos)

end)
]]

--------------------------------------------------------------------------------------- Lua管理器页面
--------------------------------------------------------------------------------------- Lua管理器页面

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("SCH LUA(测试)") 
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("任务功能") 

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("佩里科终章一键完成", function()
    locals.set_int("fm_mission_controller_2020","46829","50")
    locals.set_int("fm_mission_controller_2020","45450","9")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("配置佩岛前置(猎豹雕像)", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_TARGET"), 5, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_BS_GEN"), 131071, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_BS_ENTR"), 63, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_APPROACH"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_WEAPONS"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_WEP_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_ARM_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_HEL_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_GOLD_C"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_GOLD_C_SCOPED"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_PAINT_SCOPED"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_PAINT"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_GOLD_V"), 585151, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_PAINT_V"), 438863, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4_PROGRESS"), 124271, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4_MISSIONS"), 65279, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_COKE_I_SCOPED"), 16777215, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_COKE_I"), 16777215, true)

    gui.show_message("写入完成", "远离计划面板并重新接近以刷新面板")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("配置佩岛前置(粉钻)", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_TARGET"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_BS_GEN"), 131071, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_BS_ENTR"), 63, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_APPROACH"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_WEAPONS"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_WEP_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_ARM_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4CNF_HEL_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_GOLD_C"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_GOLD_C_SCOPED"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_PAINT_SCOPED"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_PAINT"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_GOLD_V"), 585151, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_PAINT_V"), 438863, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4_PROGRESS"), 124271, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4_MISSIONS"), 65279, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_COKE_I_SCOPED"), 16777215, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H4LOOT_COKE_I"), 16777215, true)

    gui.show_message("写入完成", "远离计划面板并重新接近以刷新面板")

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("配置赌场前置(钻石)", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_APPROACH"), 2, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3_LAST_APPROACH"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_TARGET"), 3, true) --diamond
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_BITSET1"), 159, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_KEYLEVELS"), 2, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_DISRUPTSHIP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_CREWWEAP"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_CREWDRIVER"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_CREWHACKER"), 5, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_VEHS"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_WEAPS"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_BITSET0"),443351, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_MASKS"), 12, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3_COMPLETEDPOSIX"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."CAS_HEIST_FLOW"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_POI"), 1023, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_ACCESSPOINTS"), 2047, true)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("配置赌场前置(黄金)", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_APPROACH"), 2, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3_LAST_APPROACH"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_TARGET"), 1, true) --gold
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_BITSET1"), 159, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_KEYLEVELS"), 2, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_DISRUPTSHIP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_CREWWEAP"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_CREWDRIVER"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_CREWHACKER"), 5, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_VEHS"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_WEAPS"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_BITSET0"),443351, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_MASKS"), 12, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3_COMPLETEDPOSIX"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."CAS_HEIST_FLOW"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_POI"), 1023, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_ACCESSPOINTS"), 2047, true)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("重置赌场计划面板", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_APPROACH"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3_LAST_APPROACH"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_TARGET"), 0, true) --gold
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_BITSET1"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_KEYLEVELS"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_DISRUPTSHIP"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_BITSET0"),0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_MASKS"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3_COMPLETEDPOSIX"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."CAS_HEIST_FLOW"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_POI"), 0, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."H3OPT_ACCESSPOINTS"), 0, true)
end)


gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("娱乐功能") 

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("放烟花", function()
    local animlib = 'anim@mp_fireworks'
    local ptfx_asset = "scr_indep_fireworks"
    local anim_name = 'place_firework_3_box'
    local effect_name = "scr_indep_firework_trailburst"

    STREAMING.REQUEST_ANIM_DICT(animlib)

    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0.0, 0.52, 0.0)
    local ped = PLAYER.PLAYER_PED_ID()

    ENTITY.FREEZE_ENTITY_POSITION(ped, true)
    TASK.TASK_PLAY_ANIM(ped, animlib, anim_name, -1, -8.0, 3000, 0, 0, false, false, false)

    script.sleep(1500)

    local firework_box =     create_object(3176209716, pos)
    local firework_box_pos = ENTITY.GET_ENTITY_COORDS(firework_box)

    OBJECT.PLACE_OBJECT_ON_GROUND_PROPERLY(firework_box)
    ENTITY.FREEZE_ENTITY_POSITION(ped, false)

    script.sleep(1000)

    ENTITY.FREEZE_ENTITY_POSITION(firework_box, true)
    STREAMING.REQUEST_NAMED_PTFX_ASSET("scr_indep_fireworks")

    if STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("scr_indep_fireworks") == 1 then
        local test1=STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("scr_indep_fireworks")
        GRAPHICS.USE_PARTICLE_FX_ASSET("scr_indep_fireworks")
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("scr_indep_firework_trailburst",firework_box, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 0, 0)

        script.sleep(1500)
        GRAPHICS.USE_PARTICLE_FX_ASSET("scr_indep_fireworks")
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("scr_indep_firework_trailburst",firework_box, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 0, 0)
  
        script.sleep(1500)
        GRAPHICS.USE_PARTICLE_FX_ASSET("scr_indep_fireworks")
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("scr_indep_firework_trailburst",firework_box, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 0, 0)
 
        script.sleep(1500)
        GRAPHICS.USE_PARTICLE_FX_ASSET("scr_indep_fireworks")
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("scr_indep_firework_trailburst",firework_box, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 0, 0)
  
        script.sleep(1500)
        GRAPHICS.USE_PARTICLE_FX_ASSET("scr_indep_fireworks")
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("scr_indep_firework_trailburst",firework_box, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 0, 0)
        
    end
    --ENTITY.SET_ENTITY_AS_MISSION_ENTITY(firework_box, true, true)
    --ENTITY.SET_ENTITY_AS_NO_LONGER_NEEDED(firework_box)
    --ENTITY.DELETE_ENTITY(firework_box)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("飞天扫帚", function()
    local pos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0.0, 0.52, 0.0)
    local broomstick = MISC.GET_HASH_KEY("prop_tool_broom")
    local oppressor = MISC.GET_HASH_KEY("oppressor2")
    STREAMING.REQUEST_MODEL(broomstick)
    STREAMING.REQUEST_MODEL(oppressor)
    obj = OBJECT.CREATE_OBJECT(broomstick, pos.x,pos.y,pos.z, true, false, false)
    veh = VEHICLE.CREATE_VEHICLE(oppressor, pos.x,pos.y,pos.z, 0 , true, true, true)
    ENTITY.SET_ENTITY_VISIBLE(veh, false, false)
    PED.SET_PED_INTO_VEHICLE(PLAYER.PLAYER_PED_ID(), veh, -1)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(obj, veh, 0, 0, 0, 0.3, -80.0, 0, 0, true, false, false, false, 0, true) 

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("头顶666", function()
    local md6 = "prop_mp_num_6"
    attach_to_player(md6, 0, 0.0, 0, 1.7, 0, 0,0)
    attach_to_player(md6, 0, 1.0, 0, 1.7, 0, 0,0)
    attach_to_player(md6, 0, -1.0, 0, 1.7, 0, 0,0)
end)

local check6 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_checkbox("游泳模式")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

local check7 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_checkbox("喷火")

bigfireWings = {
    [1] = {pos = {[1] = 120, [2] =  75}},
    [2] = {pos = {[1] = 120, [2] = -75}},
    [3] = {pos = {[1] = 135, [2] =  75}},
    [4] = {pos = {[1] = 135, [2] = -75}},
    [5] = {pos = {[1] = 180, [2] =  75}},
    [6] = {pos = {[1] = 180, [2] = -75}},
    [7] = {pos = {[1] = 190, [2] =  75}},
    [8] = {pos = {[1] = 190, [2] = -75}},
    [9] = {pos = {[1] = 130, [2] =  75}},
    [10] = {pos = {[1] = 130, [2] = -75}},
    [11] = {pos = {[1] = 140, [2] =  75}},
    [12] = {pos = {[1] = 140, [2] = -75}},
    [13] = {pos = {[1] = 150, [2] =  75}},
    [14] = {pos = {[1] = 150, [2] = -75}},
    [15] = {pos = {[1] = 210, [2] =  75}},
    [16] = {pos = {[1] = 210, [2] = -75}},
    [17] = {pos = {[1] = 195, [2] =  75}},
    [18] = {pos = {[1] = 195, [2] = -75}},
    [19] = {pos = {[1] = 160, [2] =  75}},
    [20] = {pos = {[1] = 160, [2] = -75}},
    [21] = {pos = {[1] = 170, [2] =  75}},
    [22] = {pos = {[1] = 170, [2] = -75}},
    [23] = {pos = {[1] = 200, [2] =  75}},
    [24] = {pos = {[1] = 200, [2] = -75}},
}
local ptfxAegg

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

local check8 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_checkbox("火焰翅膀")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("中高风险功能") 

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("CEO仓库出货一键完成", function()
    locals.set_int("gb_contraband_sell","542","99999")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("摩托帮出货一键完成", function()
    locals.set_int("gb_biker_contraband_sell","821","30")
end)
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("摩托帮产业满原材料", function()
    globals.set_int(1648657+1+1,1) --可卡因
    globals.set_int(1648657+1+2,1) --冰毒
    globals.set_int(1648657+1+3,1) --大麻
    globals.set_int(1648657+1+4,1) --证件
    globals.set_int(1648657+1+0,1) --假钞
    gui.show_message("自动补货","全部完成")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("地堡满原材料", function()
    globals.set_int(1648657+1+5,1) --bunker
    gui.show_message("自动补货","全部完成")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("CEO仓库员工进货一次", function()
    STATS.SET_PACKED_STAT_BOOL_CODE(32359,1,playerid)
    STATS.SET_PACKED_STAT_BOOL_CODE(32360,1,playerid)
    STATS.SET_PACKED_STAT_BOOL_CODE(32361,1,playerid)
    STATS.SET_PACKED_STAT_BOOL_CODE(32362,1,playerid)
    STATS.SET_PACKED_STAT_BOOL_CODE(32363,1,playerid)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("机库员工进货一次", function()
    STATS.SET_PACKED_STAT_BOOL_CODE(36828,1,playerid)
end)

local check3 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_checkbox("锁定仓库单次进货数量为")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

local iputint1 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_input_int("个板条箱")



local check4 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_checkbox("锁定机库单次进货数量为")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

local iputint3 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_input_int("箱")



gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("夜总会保险箱30万循环10次", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    a2 =0
    while a2 < 10 do
        a2 = a2 + 1
        gui.show_message("已执行次数", a2)
        globals.set_int(262145 + 24227,300000)
        globals.set_int(262145 + 24223,300000)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."CLUB_POPULARITY"), 10000, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."CLUB_PAY_TIME_LEFT"), -1, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."CLUB_POPULARITY"), 100000, true)
        gui.show_message("警告", "此方法仅用于偶尔小额恢复")
        script.sleep(10000)
    
    end
end)


--[[  已被检测
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("移除赌场轮盘冷却", function()
     local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

local mpx = "MP0_"
if playerid == 0 then 
    mpx = "MP1_" 

end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."LUCKY_WHEEL_NUM_SPIN"), 0, true)
    globals.set_int(262145+27382,1) -- 9960150 
    globals.set_int(262145+27383,1) -- -312420223
end)
]]--
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("传送")
function tpfac()
    local Pos = HUD.GET_BLIP_COORDS(HUD.GET_FIRST_BLIP_INFO_ID(590))
    if HUD.DOES_BLIP_EXIST(HUD.GET_FIRST_BLIP_INFO_ID(590)) then
        PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), Pos.x, Pos.y, Pos.z)
    end

end
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("设施", function()
    local PlayerPos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0.0, 0.52, 0.0)
    local intr = INTERIOR.GET_INTERIOR_AT_COORDS(PlayerPos.x, PlayerPos.y, PlayerPos.z)

    if intr == 269313 then 
        gui.show_message("无需传送","您已在设施内")
    else
        tpfac()
    end
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("设施计划屏幕", function()
    local PlayerPos = ENTITY.GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(PLAYER.PLAYER_PED_ID(), 0.0, 0.52, 0.0)
    local intr = INTERIOR.GET_INTERIOR_AT_COORDS(PlayerPos.x, PlayerPos.y, PlayerPos.z)
    if intr == 269313 then 
        if HUD.DOES_BLIP_EXIST(HUD.GET_FIRST_BLIP_INFO_ID(428)) then
            PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), 350.69284, 4872.308, -60.794243)
        end
    else
        gui.show_message("确保自己在设施内","请先进入设施再传送到计划屏幕")
        tpfac()
    end
end)

--从MusinessBanager抄的
local NightclubPropertyInfo = {
    [1]  = {name = "La Mesa Nightclub",           coords = {x = 757.009,   y =  -1332.32,  z = 27.1802 }},
    [2]  = {name = "Mission Row Nightclub",       coords = {x = 345.7519,  y =  -978.8848, z = 29.2681 }},
    [3]  = {name = "Strawberry Nightclub",        coords = {x = -120.906,  y =  -1260.49,  z = 29.2088 }},
    [4]  = {name = "West Vinewood Nightclub",     coords = {x = 5.53709,   y =  221.35,    z = 107.6566}},
    [5]  = {name = "Cypress Flats Nightclub",     coords = {x = 871.47,    y =  -2099.57,  z = 30.3768 }},
    [6]  = {name = "LSIA Nightclub",              coords = {x = -676.625,  y =  -2458.15,  z = 13.8444 }},
    [7]  = {name = "Elysian Island Nightclub",    coords = {x = 195.534,   y =  -3168.88,  z = 5.7903  }},
    [8]  = {name = "Downtown Vinewood Nightclub", coords = {x = 373.05,    y =  252.13,    z = 102.9097}},
    [9]  = {name = "Del Perro Nightclub",         coords = {x = -1283.38,  y =  -649.916,  z = 26.5198 }},
    [10] = {name = "Vespucci Canals Nightclub",   coords = {x = -1174.85,  y =  -1152.3,   z = 5.56128 }},
}

-- Business / Other Online Work Stuff [[update]]
local function GetOnlineWorkOffset()
    -- GLOBAL_PLAYER_STAT
    return (1853988 + 1 + (playerid * 867) + 267)
end
local function GetNightClubHubOffset()
    return (GetOnlineWorkOffset() + 310)
end
local function GetNightClubOffset()
    return (GetOnlineWorkOffset() + 354) -- CLUB_OWNER_X
end

local function GetWarehouseOffset()
    return (GetOnlineWorkOffset() + 116) + 1
end

local function GetMCBusinessOffset()
    return (GetOnlineWorkOffset() + 193) + 1
end
local function GetNightClubPropertyID()
    return globals.get_int(GetNightClubOffset())
end

local function IsPlayerInNightclub()
    return (GetPlayerPropertyID() > 101) and (GetPlayerPropertyID() < 112)
end

function tpnc() --传送到夜总会
    local property = GetNightClubPropertyID()
    if property ~= 0  then
        local coords = NightclubPropertyInfo[property].coords
        PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), coords.x, coords.y, coords.z)
    end
end

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("夜总会", function()
    tpnc()
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("夜总会保险箱(先进入夜总会)", function()
    PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(), -1615.6832, -3015.7546, -75.204994)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("游戏厅", function()

    local Blip = HUD.GET_FIRST_BLIP_INFO_ID(740) -- Arcade Blip
    local Pos = HUD.GET_BLIP_COORDS(Blip)
    local Label = HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION(ZONE.GET_NAME_OF_ZONE(Pos.x, Pos.y, Pos.z))

 if string.find(HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION("MP_ARC_1"), Label) ~= nil then 
    ArcadePos = vec3:new(-245.9931, 6210.773, 31.939024)
    PED.SET_PED_DESIRED_HEADING(PLAYER.PLAYER_PED_ID(), -50)
 end
 if string.find(HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION("MP_ARC_2"), Label) ~= nil then 
    ArcadePos = vec3:new(1695.5393, 4784.196, 41.94444)
    PED.SET_PED_DESIRED_HEADING(PLAYER.PLAYER_PED_ID(), -95)
 end
 if string.find(HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION("MP_ARC_3"), Label) ~= nil then 
    ArcadePos = vec3:new(-115.45246, -1772.0801, 29.858917)
    PED.SET_PED_DESIRED_HEADING(PLAYER.PLAYER_PED_ID(), -125)
 end
 if string.find(HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION("FMC_LOC_WSTVNWD"), Label) ~= nil then 
    ArcadePos = vec3:new(-600.911, 279.97433, 82.041245)
    PED.SET_PED_DESIRED_HEADING(PLAYER.PLAYER_PED_ID(), 80)
 end
 if string.find(HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION("MP_ARC_5"), Label) ~= nil then 
    ArcadePos = vec3:new(-1269.7747, -304.4372, 37.001965)
    PED.SET_PED_DESIRED_HEADING(PLAYER.PLAYER_PED_ID(), 75)
 end
 if string.find(HUD.GET_FILENAME_FOR_AUDIO_CONVERSATION("MP_ARC_6"), Label) ~= nil then 
    ArcadePos = vec3:new(758.91815, -814.60864, 26.301702)
    PED.SET_PED_DESIRED_HEADING(PLAYER.PLAYER_PED_ID(), 90)

 end

  PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(),  ArcadePos.x, ArcadePos.y,  ArcadePos.z)

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("游戏厅计划面板(先进游戏厅)", function()
    PED.SET_PED_COORDS_KEEP_VEHICLE(PLAYER.PLAYER_PED_ID(),  2711.773, -369.458, -54.781)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("杂项")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("预览万圣节猎鬼活动", function()
    globals.set_int(262145+35064,1) --Ghost hunt enable
    globals.set_int(262145+35158,50000) --Ghost hunt GHOSTHUNT_CASH_REWARD
    gui.show_message("鬼将随机生成在某个位置","该活动只发生在晚八点至次日凌晨六点")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("移除达克斯冷却", function()
    local playerid = globals.get_int(1574918) --疑似与MPPLY_LAST_MP_CHAR相等

    local mpx = "MP0_"
    if playerid == 0 then 
        mpx = "MP1_" 
    
    end
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY(mpx.."XM22JUGGALOWORKCDTIMER"), -1, true)

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("移除自身悬赏", function()
    globals.set_int(1+2359296+5150+13,2880000)   
end)
        
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("跳过一条对话", function()
    AUDIO.SKIP_TO_NEXT_SCRIPTED_CONVERSATION_LINE()
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("解除部分卡云", function()
    if NETWORK.NETWORK_CAN_BAIL() then
        NETWORK.NETWORK_BAIL(0, 0, 0)
    end
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("移除视觉效果", function()
    GRAPHICS.ANIMPOSTFX_STOP_ALL()
    GRAPHICS.SET_TIMECYCLE_MODIFIER("DEFAULT")

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("视觉效果:吸毒", function()
    GRAPHICS.ANIMPOSTFX_PLAY("DrugsDrivingIn", 5, true)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("模糊", function()
    GRAPHICS.ANIMPOSTFX_PLAY("MenuMGSelectionIn", 5, true)
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("提升亮度", function()
    GRAPHICS.SET_TIMECYCLE_MODIFIER("AmbientPush")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("大雾", function()
    GRAPHICS.SET_TIMECYCLE_MODIFIER("casino_main_floor_heist")
end)


local check1 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_checkbox("移除交易错误警告")

--[[
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试4", function()
    local start_time = os.time()
    local duration = 5  
    
    while os.time() - start_time < duration do
    local scaleForm = GRAPHICS.REQUEST_SCALEFORM_MOVIE("POPUP_WARNING")
    GRAPHICS.DRAW_RECT(.5, .5, 1, 1, 255, 158, 177, 255)
    GRAPHICS.BEGIN_SCALEFORM_MOVIE_METHOD(scaleForm, "SHOW_POPUP_WARNING")
    GRAPHICS.DRAW_SCALEFORM_MOVIE_FULLSCREEN(scaleForm, 0, 0, 0, 0, 0)
    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_FLOAT(500.0)
    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_TEXTURE_NAME_STRING("YIMMENU")
    GRAPHICS.SCALEFORM_MOVIE_METHOD_ADD_PARAM_TEXTURE_NAME_STRING("欢迎使用SCH LUA")

    GRAPHICS.END_SCALEFORM_MOVIE_METHOD(scaleForm)

    script.sleep(5)
    end
end)
]]--

--------------------------------------------------------------------------------------- Players 页面
--------------------------------------------------------------------------------------- Players 页面

gui.get_tab(""):add_separator()
gui.get_tab(""):add_text("SCH LUA玩家选项") 


gui.get_tab(""):add_button("栅栏笼子", function()
    local objHash <const> = MISC.GET_HASH_KEY("prop_fnclink_03e")
    STREAMING.REQUEST_MODEL(objHash)

    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)

    pos.z = pos.z - 1.0
    local object = {}

    object[1] = OBJECT.CREATE_OBJECT(objHash, pos.x - 1.5, pos.y + 1.5, pos.z,true, 1, 0)
    object[2] = OBJECT.CREATE_OBJECT(objHash, pos.x - 1.5, pos.y - 1.5, pos.z,true, 1, 0)

    object[3] = OBJECT.CREATE_OBJECT(objHash, pos.x + 1.5, pos.y + 1.5, pos.z,true, 1, 0)
    local rot_3 = ENTITY.GET_ENTITY_ROTATION(object[3], 2)
    rot_3.z = -90.0
    ENTITY.SET_ENTITY_ROTATION(object[3], rot_3.x, rot_3.y, rot_3.z, 1, true)

    object[4] = OBJECT.CREATE_OBJECT(objHash, pos.x - 1.5, pos.y + 1.5, pos.z,true, 1, 0)
    local rot_4 = ENTITY.GET_ENTITY_ROTATION(object[4], 2)
    rot_4.z = -90.0
    ENTITY.SET_ENTITY_ROTATION(object[4], rot_4.x, rot_4.y, rot_4.z, 1, true)
    ENTITY.IS_ENTITY_STATIC(object[1]) 
    ENTITY.IS_ENTITY_STATIC(object[2])
    ENTITY.IS_ENTITY_STATIC(object[3])
    ENTITY.IS_ENTITY_STATIC(object[4])
    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(object[1], false) 
    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(object[2], false) 
    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(object[3], false) 
    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(object[4], false) 

    for i = 1, 4 do ENTITY.FREEZE_ENTITY_POSITION(object[i], true) end
    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(objHash)

end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("竞技管笼子", function()
    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    STREAMING.REQUEST_MODEL(2081936690)

	while not STREAMING.HAS_MODEL_LOADED(2081936690) do		
        script.sleep(100)
	end
    local cage_object = OBJECT.CREATE_OBJECT(2081936690, pos.x, pos.y, pos.z-5, true, true, false)

    script.sleep(15)
    local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
    rot.y = 90
    ENTITY.SET_ENTITY_ROTATION(cage_object, rot.x,rot.y,rot.z,1,true)


    local cage_object2 = OBJECT.CREATE_OBJECT(2081936690, pos.x-5, pos.y+5, pos.z-5, true, true, false)

    script.sleep(15)
    local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object2)
    rot.x = 90 
    ENTITY.SET_ENTITY_ROTATION(cage_object2, rot.x,rot.y,rot.z,2,true)


end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("保险箱笼子", function()
	local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
	local hash = 1089807209
	STREAMING.REQUEST_MODEL(hash)

	while not STREAMING.HAS_MODEL_LOADED(hash) do		
        script.sleep(100)
	end
	local cage_object = OBJECT.CREATE_OBJECT(hash, pos.x - 1, pos.y, pos.z - .5, true, true, false) -- front
	local cage_object2 = OBJECT.CREATE_OBJECT(hash, pos.x + 1, pos.y, pos.z - .5, true, true, false) -- back
	local cage_object3 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y + 1, pos.z - .5, true, true, false) -- left
	local cage_object4 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y - 1, pos.z - .5, true, true, false) -- right
	local cage_object5 = OBJECT.CREATE_OBJECT(hash, pos.x, pos.y, pos.z + .75, true, true, false) -- above
	cages[#cages + 1] = cage_object

	local rot  = ENTITY.GET_ENTITY_ROTATION(cage_object)
	rot.y = 90

	ENTITY.FREEZE_ENTITY_POSITION(cage_object, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object2, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object3, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object4, true)
	ENTITY.FREEZE_ENTITY_POSITION(cage_object5, true)
    script.sleep(100)
	STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(cage_object)

end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("电击", function()

    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 1000, true, MISC.GET_HASH_KEY("weapon_stungun"), false, false, true, 1.0)

end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("轰炸", function()

    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    airshash = MISC.GET_HASH_KEY("vehicle_weapon_trailer_dualaa")
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z- 1 , pos.x, pos.y, pos.z - 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z- 1 , pos.x+2, pos.y, pos.z - 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z- 1 , pos.x-2, pos.y, pos.z - 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z- 1 , pos.x-2, pos.y-2, pos.z - 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z- 1 , pos.x-2, pos.y+2, pos.z - 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 1 , pos.x, pos.y, pos.z + 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 1 , pos.x+2, pos.y, pos.z + 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 1 , pos.x-2, pos.y, pos.z + 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 1 , pos.x-2, pos.y-2, pos.z + 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 1 , pos.x-2, pos.y+2, pos.z + 1, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 3 , pos.x, pos.y, pos.z + 3, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 3, pos.x+2, pos.y, pos.z + 3, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 3, pos.x-2, pos.y, pos.z + 3, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 3 , pos.x-2, pos.y-2, pos.z + 3, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 3 , pos.x-2, pos.y+2, pos.z + 3, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 5, pos.x, pos.y, pos.z + 5, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 5 , pos.x+2, pos.y, pos.z + 5, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 5 , pos.x-2, pos.y, pos.z + 5, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 5, pos.x-2, pos.y-2, pos.z + 5, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 5 , pos.x-2, pos.y+2, pos.z + 5, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 7 , pos.x, pos.y, pos.z + 7, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 7 , pos.x+2, pos.y, pos.z + 7, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 7 , pos.x-2, pos.y, pos.z + 7, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 7 , pos.x-2, pos.y-2, pos.z + 7, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 7 , pos.x-2, pos.y+2, pos.z + 7, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 9 , pos.x, pos.y, pos.z + 9, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 9 , pos.x+2, pos.y, pos.z + 9, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 9 , pos.x-2, pos.y, pos.z + 9, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 9 , pos.x-2, pos.y-2, pos.z + 9, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 9 , pos.x-2, pos.y+2, pos.z + 9, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 11 , pos.x, pos.y, pos.z + 11, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 11 , pos.x+2, pos.y, pos.z + 11, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 11 , pos.x-2, pos.y, pos.z + 11, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 11 , pos.x-2, pos.y-2, pos.z + 11, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 11 , pos.x-2, pos.y+2, pos.z + 11, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 13 , pos.x, pos.y, pos.z + 13, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 13 , pos.x+2, pos.y, pos.z + 13, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 13 , pos.x-2, pos.y, pos.z + 13, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 13 , pos.x-2, pos.y-2, pos.z + 13, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 13 , pos.x-2, pos.y+2, pos.z + 13, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 15 , pos.x, pos.y, pos.z + 15, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 15 , pos.x+2, pos.y, pos.z + 15, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 15 , pos.x-2, pos.y, pos.z + 15, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 15 , pos.x-2, pos.y-2, pos.z + 15, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 15 , pos.x-2, pos.y+2, pos.z + 15, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 17 , pos.x, pos.y, pos.z + 17, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 17 , pos.x+2, pos.y, pos.z + 17, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 17 , pos.x-2, pos.y, pos.z + 17, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 17 , pos.x-2, pos.y-2, pos.z + 17, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 17 , pos.x-2, pos.y+2, pos.z + 17, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 19 , pos.x, pos.y, pos.z + 19, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 19 , pos.x+2, pos.y, pos.z + 19, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 19 , pos.x-2, pos.y, pos.z + 19, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 19 , pos.x-2, pos.y-2, pos.z + 19, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 19 , pos.x-2, pos.y+2, pos.z + 19, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 21 , pos.x, pos.y, pos.z + 21, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 21 , pos.x+2, pos.y, pos.z + 21, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 21 , pos.x-2, pos.y, pos.z + 21, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 21 , pos.x-2, pos.y-2, pos.z + 21, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 21 , pos.x-2, pos.y+2, pos.z + 21, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 23 , pos.x, pos.y, pos.z + 23, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 23 , pos.x+2, pos.y, pos.z + 23, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 23 , pos.x-2, pos.y, pos.z + 23, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 23 , pos.x-2, pos.y-2, pos.z + 23, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 23 , pos.x-2, pos.y+2, pos.z + 23, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 25 , pos.x, pos.y, pos.z + 25, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 25 , pos.x+2, pos.y, pos.z + 25, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 25 , pos.x-2, pos.y, pos.z + 25, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 25 , pos.x-2, pos.y-2, pos.z + 25, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 25 , pos.x-2, pos.y+2, pos.z + 25, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 27 , pos.x, pos.y, pos.z + 27, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 27 , pos.x+2, pos.y, pos.z + 27, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 27 , pos.x-2, pos.y, pos.z + 27, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 27 , pos.x-2, pos.y-2, pos.z + 27, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 27 , pos.x-2, pos.y+2, pos.z + 27, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 29 , pos.x, pos.y, pos.z + 29, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 29 , pos.x+2, pos.y, pos.z + 29, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 29 , pos.x-2, pos.y, pos.z + 29, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 29 , pos.x-2, pos.y-2, pos.z + 29, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 29 , pos.x-2, pos.y+2, pos.z + 29, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 31 , pos.x, pos.y, pos.z + 31, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 31 , pos.x+2, pos.y, pos.z + 31, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 31 , pos.x-2, pos.y, pos.z + 31, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 31 , pos.x-2, pos.y-2, pos.z + 31, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 31 , pos.x-2, pos.y+2, pos.z + 31, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 33 , pos.x, pos.y, pos.z + 33, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 33 , pos.x+2, pos.y, pos.z + 33, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-22, pos.y, pos.z+ 33 , pos.x-2, pos.y, pos.z + 33, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 33 , pos.x-2, pos.y-2, pos.z + 33, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 33 , pos.x-2, pos.y+2, pos.z + 3, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 35 , pos.x, pos.y, pos.z + 35, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 35 , pos.x+2, pos.y, pos.z + 35, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 35 , pos.x-2, pos.y, pos.z + 35, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-22, pos.y-2, pos.z+ 35 , pos.x-2, pos.y-2, pos.z + 35, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 35 , pos.x-2, pos.y+2, pos.z + 35, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 37 , pos.x, pos.y, pos.z + 37, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 37 , pos.x+2, pos.y, pos.z + 37, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 37 , pos.x-2, pos.y, pos.z + 37, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 37 , pos.x-2, pos.y-2, pos.z + 37, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 37 , pos.x-2, pos.y+2, pos.z + 37, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 39 , pos.x, pos.y, pos.z + 39, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 39 , pos.x+2, pos.y, pos.z + 39, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 39 , pos.x-2, pos.y, pos.z + 39, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 39 , pos.x-2, pos.y-2, pos.z + 39, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 39 , pos.x-2, pos.y+2, pos.z + 39, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 41 , pos.x, pos.y, pos.z + 41, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 41 , pos.x+2, pos.y, pos.z + 41, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 41 , pos.x-2, pos.y, pos.z + 41, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 41 , pos.x-2, pos.y-2, pos.z + 41, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 41 , pos.x-2, pos.y+2, pos.z + 41, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 43 , pos.x, pos.y, pos.z + 43, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 43 , pos.x+2, pos.y, pos.z + 43, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 43 , pos.x-2, pos.y, pos.z + 43, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 43 , pos.x-2, pos.y-2, pos.z + 43, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 43 , pos.x-2, pos.y+2, pos.z + 43, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    script.sleep(100)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z+ 45 , pos.x, pos.y, pos.z + 45, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x+2, pos.y, pos.z+ 45 , pos.x+2, pos.y, pos.z + 45, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y, pos.z+ 45 , pos.x-2, pos.y, pos.z + 45, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y-2, pos.z+ 45 , pos.x-2, pos.y-2, pos.z + 45, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x-2, pos.y+2, pos.z+ 45 , pos.x-2, pos.y+2, pos.z + 45, 10000, true, airshash, PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 10000)

end)

gui.get_tab(""):add_sameline()

local check8 = gui.get_tab(""):add_checkbox("循环水柱")
gui.get_tab(""):add_button("循环水柱", function()

end)

local check2 = gui.get_tab(""):add_checkbox("掉帧攻击(尽可能远离目标)")

gui.get_tab(""):add_sameline()

local check5 = gui.get_tab(""):add_checkbox("粒子效果轰炸(尽可能远离目标)")

--------------------------------------------------------------------------------------- Players 页面
--------------------------------------------------------------------------------------- Players 页面

--[[
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("TSE C", function()

    local karmaPid = network.get_selected_player()
    
    network.trigger_script_event(1 << karmaPid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
    network.trigger_script_event(1 << karmaPid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
    network.trigger_script_event(1 << karmaPid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
    network.trigger_script_event(1 << karmaPid, {879177392, 3, 7264839016258354765, 10597, 73295, 3274114858851387039, 4862623901289893625, 54483})
    network.trigger_script_event(1 << karmaPid, {548471420, 3, 804923209, 1128590390, 136699892, -168325547, -814593329, 1630974017, 1101362956, 1510529262, 2, 1875285955, 633832161, -1097780228})
end)
    
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab(""):add_button("模型1", function()
    
    STREAMING.REQUEST_MODEL(-1364166376)
    local c = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    local cone = OBJECT.CREATE_OBJECT_NO_OFFSET(-1364166376, c.x, c.y, c.z, true, false, false)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cone, cone, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, true, false, 0, true)
end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("模型2", function()

local cord = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
local object = create_object(MISC.GET_HASH_KEY("virgo"), cord)
local object = create_object(MISC.GET_HASH_KEY("osiris"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_firealarm"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_bs_cond"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_bs_foamx3"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor07"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor06"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor05"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_bs_gelx3"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor01"), cord)
local object = create_object(MISC.GET_HASH_KEY("feltzer3"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor02"), cord)
local object = create_object(MISC.GET_HASH_KEY("windsor"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor04"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_ct_monitor03"), cord)
local object = create_object(MISC.GET_HASH_KEY("v_serv_bs_clutter"), cord)
ENTITY.SET_ENTITY_AS_MISSION_ENTITY(object, true, true)
ENTITY.APPLY_FORCE_TO_ENTITY_CENTER_OF_MASS(object, 1, 0.0, 10000.0, 0.0, 0.0, 0.0, 0.0, false, true, true, false, true)
ENTITY.SET_ENTITY_ROTATION(object, math.random(0, 360), math.random(0, 360), math.random(0, 360), 0, true)
ENTITY.SET_ENTITY_VELOCITY(object, math.random(-10, 10), math.random(-10, 10), math.random(30, 50))
ENTITY.ATTACH_ENTITY_TO_ENTITY(object, object, 0, 0, -1, 2.5, 0, 180, 0, 0, false, true, false, 0, true)
script.sleep(300)
MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(cord.x, cord.y, cord.z + 1, cord.x, cord.y, cord.z, 0, true, MISC.GET_HASH_KEY("weapon_heavysniper_mk2"), PLAYER.GET_PLAYER_PED(network.get_selected_player()), false, true, 1.0)
ENTITY.DETACH_ENTITY(object, object)
--delete_by_handle(object)
end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("模型4", function()
    local TTPed = PLAYER.GET_PLAYER_PED(network.get_selected_player())
    local TTPos = ENTITY.GET_ENTITY_COORDS(TTPed, true)
            local spped = PLAYER.PLAYER_PED_ID()
            local SelfPlayerPos = ENTITY.GET_ENTITY_COORDS(spped, true)
            SelfPlayerPos.x = SelfPlayerPos.x + 10
            TTPos.x = TTPos.x + 10
            local carc = CreateObject(joaat("apa_prop_flag_china"), TTPos, ENTITY.GET_ENTITY_HEADING(spped), true)
            local carcPos = ENTITY.GET_ENTITY_COORDS(vehicle, true)
            local pedc = CreatePed(26, joaat("A_C_HEN"), TTPos, 0)
            local pedcPos = ENTITY.GET_ENTITY_COORDS(vehicle, true)
            local ropec = PHYSICS.ADD_ROPE(TTPos.x, TTPos.y, TTPos.z, 0, 0, 0, 1, 1, 0.00300000000000000000000000000000000000000000000001, 1, 1, true, true, true, 1.0, true, 0)
            PHYSICS.ATTACH_ENTITIES_TO_ROPE(ropec,carc,pedc,carcPos.x, carcPos.y, carcPos.z ,pedcPos.x, pedcPos.y, pedcPos.z,2, false, false, 0, 0, "Center","Center")
            script.sleep(3500)
            PHYSICS.DELETE_CHILD_ROPE(ropec)
           -- entities.delete_by_handle(pedc)
    
end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("模型3", function()
    pedp = PLAYER.GET_PLAYER_PED(network.get_selected_player())
    pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    towtruck = CreateVehicle(-1323100960, pos, 0)
    skylift = CreateVehicle(-692292317, pos, 0)
    cargobob = CreateVehicle(4244420235, pos, 0)
    cargobob2 = CreateVehicle(4244420235, pos, 0)
    cargobob1 = CreateVehicle(4244420235, pos, 0)
    handler = CreateVehicle(444583674, pos, 0)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cargobob, skylift, 0, 0, 0, 0.2, 0, 0, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cargobob1, skylift, 0, 0, 0, -0.2, 0, 0, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(handler, skylift, 0, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(towtruck, skylift, 0, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(cargobob2, towtruck, 0, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)
    ENTITY.ATTACH_ENTITY_TO_ENTITY(skylift, pedp, 0, 0, 0, 0, 0, 0, 0, false, true, false, 0, true)

end)

gui.get_tab(""):add_sameline()

gui.get_tab(""):add_button("A C", function()
    local time = os.time() + 2
    while time > os.time() do
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
        for i = 1, 20 do
            AUDIO.PLAY_SOUND_FROM_COORD(-1, 'Event_Message_Purple', pos.x, pos.y, pos.z, 'GTAO_FM_Events_Soundset', true, 1000, false)
            AUDIO.PLAY_SOUND_FROM_COORD(-1, '5s', pos.x, pos.y, pos.z, 'GTAO_FM_Events_Soundset', true, 1000, false)
        end
        script.sleep(20)
    end	

end)
]]
--[[
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("IN MD C", function()
    for i = 1, 10 do
		local cord = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
        STREAMING.REQUEST_MODEL(-930879665)
        script.sleep(10)
        STREAMING.REQUEST_MODEL(3613262246)
        script.sleep(10)
        STREAMING.REQUEST_MODEL(452618762)
        script.sleep(10)
        while not STREAMING.HAS_MODEL_LOADED(-930879665) do script.sleep() end
        while not STREAMING.HAS_MODEL_LOADED(3613262246) do script.sleep() end
        while not STREAMING.HAS_MODEL_LOADED(452618762) do script.sleep() end
        local a1 = create_object(-930879665, cord)
        script.sleep(10)
        local a2 = create_object(3613262246, cord)
        script.sleep(10)
        local b1 = create_object(452618762, cord)
        script.sleep(10)
        local b2 = create_object(3613262246, cord)
    end
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试5", function()
    local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    coords.z = coords.z + 63
    local ufoModel = MISC.GET_HASH_KEY("p_spinning_anus_s")
    while STREAMING.HAS_MODEL_LOADED(ufoModel) ~= 1 do
    
        STREAMING.REQUEST_MODEL(ufoModel)
        script.sleep(100)
        
    end
    local Object = OBJECT.CREATE_OBJECT(ufoModel, coords.x, coords.y, coords.z, TRUE, TRUE, FALSE)
    local player = PLAYER.GET_PLAYER_PED(network.get_selected_player())
    local vehicle = PED.GET_VEHICLE_PED_IS_IN(player, false)

    if PED.IS_PED_IN_VEHICLE(player, vehicle, false) == 1 then 
        NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(vehicle)
        VEHICLE.BRING_VEHICLE_TO_HALT(vehicle, 3, 4, false)
        VEHICLE.SET_VEHICLE_ENGINE_ON(vehicle, false, true, true)
        ENTITY.APPLY_FORCE_TO_ENTITY(vehicle, 1, 0.0, 0.0, 65, 0.0, 0.0, 0.0, 1, false, true, true, true, true)
        VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(vehicle, true)

    else
        gui.show_message("错误","玩家不在载具中")
    end
end)
]]--
--[[
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试1", function()
    local CrashModel = MISC.GET_HASH_KEY("prop_fragtest_cnst_04")
    local Coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)

    TASK.CLEAR_PED_TASKS_IMMEDIATELY(Ped)
    TASK.CLEAR_PED_SECONDARY_TASK(Ped)
    gui.show_message("test",os.time())


    while STREAMING.HAS_MODEL_LOADED(CrashModel) ~= 1 do
    
        STREAMING.REQUEST_MODEL(CrashModel)
        script.sleep(100)
        
    end

    local Object = OBJECT.CREATE_OBJECT(CrashModel, Coords.x, Coords.y, Coords.z, TRUE, TRUE, FALSE)
    OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(Object, NULL, NULL)

    script.sleep(1000)

    STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(CrashModel)
    entity.delete_entity(Object)
    OBJECT.BREAK_OBJECT_FRAGMENT_CHILD(Object, NULL, NULL)

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试2", function()

    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), true)
    while STREAMING.HAS_MODEL_LOADED(3613262246) ~= 1 do
        STREAMING.REQUEST_MODEL(3613262246)
        script.sleep(100)
    end
    while STREAMING.HAS_MODEL_LOADED(2155335200) ~= 1 do
        STREAMING.REQUEST_MODEL(2155335200)
        script.sleep(100)
    end
    while STREAMING.HAS_MODEL_LOADED(3026699584) ~= 1 do
        STREAMING.REQUEST_MODEL(3026699584)
        script.sleep(100)
    end
    while STREAMING.HAS_MODEL_LOADED(-1348598835) ~= 1 do
        STREAMING.REQUEST_MODEL(-1348598835)
        script.sleep(100)
    end
    local Object_pizza1 = OBJECT.CREATE_OBJECT(3613262246, pos.x,pos.y,pos.z, true, false, false)
    local Object_pizza2 = OBJECT.CREATE_OBJECT(2155335200, pos.x,pos.y,pos.z, true, false, false)
    local Object_pizza3 = OBJECT.CREATE_OBJECT(3026699584, pos.x,pos.y,pos.z, true, false, false)
    local Object_pizza4 = OBJECT.CREATE_OBJECT(-1348598835, pos.x,pos.y,pos.z, true, false, false)
    for i = 0, 100 do 
        local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza1, pos.x, pos.y, pos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza2, pos.x, pos.y, pos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza3, pos.x, pos.y, pos.z, false, true, true)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(Object_pizza4, pos.x, pos.y, pos.z, false, true, true)
        script.yield(10)
    end

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试3", function()

    local TargetPlayerPos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), true)
    local PED1 =     PED.CREATE_PED(26,MISC.GET_HASH_KEY("cs_beverly"),TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z,0,true,true)
    ENTITY.SET_ENTITY_VISIBLE(PED1, false, 0)
    script.sleep(100)
    WEAPON.GIVE_WEAPON_TO_PED(PED1,-270015777,80,true,true)
    script.sleep(100)
    FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(network.get_selected_player()), TargetPlayerPos.x, TargetPlayerPos.y, TargetPlayerPos.z, 2, 50, true, false, 0.0)

end)
]]
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("全局选项") 

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("全局爆炸", function()
    for i = 0, 31 do
            FIRE.ADD_OWNED_EXPLOSION(PLAYER.GET_PLAYER_PED(i), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(i)).x, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(i)).y, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(i)).z, 82, 1, true, false, 100)
    end
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("赠送暴君MK2", function()
    STREAMING.REQUEST_MODEL(MISC.GET_HASH_KEY("oppressor2"))
    while STREAMING.HAS_MODEL_LOADED(MISC.GET_HASH_KEY("oppressor2")) ~= 1 do
        STREAMING.REQUEST_MODEL(MISC.GET_HASH_KEY("oppressor2"))
        script.sleep(100)
    end   
    for i = 0, 31 do
        veh = VEHICLE.CREATE_VEHICLE(MISC.GET_HASH_KEY("oppressor2"), ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(i)).x, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(i)).y, ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(i)).z, 0 , true, true, true)

    end
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("PED伞崩", function()
    local spped = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(PLAYER.PLAYER_ID())
    local ppos = ENTITY.GET_ENTITY_COORDS(spped, true)
    for n = 0 , 5 do
        local object_hash = joaat("prop_logpile_06b")
        STREAMING.REQUEST_MODEL(object_hash)
          while not STREAMING.HAS_MODEL_LOADED(object_hash) do
           script.yield()
        end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, 0,0,500, false, true, true)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(spped, 0xFBAB5776, 1000, false)
        script.sleep(1000)
        for i = 0 , 20 do
            PED.FORCE_PED_TO_OPEN_PARACHUTE(spped)
        end
        script.sleep(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)

        local object_hash2 = joaat("prop_beach_parasol_03")
        STREAMING.REQUEST_MODEL(object_hash2)
          while not STREAMING.HAS_MODEL_LOADED(object_hash2) do
            script.yield()
        end
        PLAYER.SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER.PLAYER_ID(),object_hash2)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, 0,0,500, 0, 0, 1)
        WEAPON.GIVE_DELAYED_WEAPON_TO_PED(spped, 0xFBAB5776, 1000, false)
        script.sleep(1000)
        for i = 0 , 20 do
            PED.FORCE_PED_TO_OPEN_PARACHUTE(spped)
        end
        script.sleep(1000)
        ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)
    end
    ENTITY.SET_ENTITY_COORDS_NO_OFFSET(spped, ppos.x, ppos.y, ppos.z, false, true, true)
end)
--[[
local iputint1 = gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_input_int("测试7")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试8", function()
    
    gui.show_message("Debughash", iputint1:get_value())

end)
]]--
--[[
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试10", function()

  if   check1:is_enabled() then
    gui.show_message("Debug", 1)
  else
    gui.show_message("Debug", 0)
  end
  PED.SET_PED_CONFIG_FLAG(PLAYER.PLAYER_PED_ID(),65,true)

end)
]]

--------------------------------------------------------------------------------------- looped

script.register_looped("rmtranserr", function() --移除交易错误警告
    if  check1:is_enabled() then
        globals.set_int(4536677,0) 
        globals.set_int(4536679,0) 
        globals.set_int(4536678,0) 
    end
end)

script.register_looped("cargolock", function() 
    if  check3:is_enabled() then--锁定CEO仓库进货数
        globals.set_int(1890714+12,iputint1:get_value()) 
    end
    if  check4:is_enabled() then--锁定机库仓库进货数
        globals.set_int(1890730+6,iputint3:get_value()) 
    end
end)


defpttable = {}
defpscount2 = 1
defpscount = 200

script.register_looped("defps", function() 
    if  check2:is_enabled() then--卡死玩家
local defpstarget = PLAYER.GET_PLAYER_PED(network.get_selected_player())
local targetcoords = ENTITY.GET_ENTITY_COORDS(defpstarget)

local hash = joaat("tug")
STREAMING.REQUEST_MODEL(hash)
while not STREAMING.HAS_MODEL_LOADED(hash) do script.yield() end

for i = 1, defpscount do
    if defpstarget ~= PLAYER.PLAYER_PED_ID() then --避免目标离开战局后作用于自己
    
    defpttable[defpscount2] = VEHICLE.CREATE_VEHICLE(hash, targetcoords.x, targetcoords.y, targetcoords.z, 0, true, true, true)

    local netID = NETWORK.NETWORK_GET_NETWORK_ID_FROM_ENTITY(defpttable[defpscount2])
    NETWORK.NETWORK_REQUEST_CONTROL_OF_ENTITY(defpttable[defpscount2])
    NETWORK.NETWORK_REQUEST_CONTROL_OF_NETWORK_ID(netID)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(netID)
    NETWORK.SET_NETWORK_ID_CAN_MIGRATE(netID, false)
    NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(netID, pid, true)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(defpttable[defpscount2], true, false)
    ENTITY.SET_ENTITY_VISIBLE(defpttable[defpscount2], false, 0)
    else
        gui.show_message("掉帧攻击已停止", "你在攻击自己!")
        check2:set_enabled(nil)
    end
end
end
if  check5:is_enabled() then --粒子效果轰炸
    local defpstarget = PLAYER.GET_PLAYER_PED(network.get_selected_player())
    local tar1 = ENTITY.GET_ENTITY_COORDS(defpstarget)
    local ptfx = {dic = 'scr_rcbarry2', name = 'scr_clown_appears'}

    if defpstarget ~= PLAYER.PLAYER_PED_ID() then --避免目标离开战局后作用于自己
        STREAMING.REQUEST_NAMED_PTFX_ASSET(ptfx.dic)
        while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED(ptfx.dic) do
            script.yield()
        end
        GRAPHICS.USE_PARTICLE_FX_ASSET(ptfx.dic)
        GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_AT_COORD( ptfx.name, tar1.x, tar1.y, tar1.z + 1, 0, 0, 0, 10.0, true, true, true)
    else
        gui.show_message("ptfx轰炸已停止", "你在攻击自己!")
        check5:set_enabled(nil)
    end

end

if  check8:is_enabled() then --水柱

    local coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    FIRE.ADD_EXPLOSION(coords.x, coords.y, coords.z - 2.0, 13, 1, true, false, 0, false)
end
end)

script.register_looped("swimeveryw", function() --随处游泳
    if  check6:is_enabled() then
        PED.SET_PED_CONFIG_FLAG(PLAYER.PLAYER_PED_ID(), 65, 81)
    end
end)

script.register_looped("fireservice", function() 
    if  check7:is_enabled() then
        STREAMING.REQUEST_NAMED_PTFX_ASSET("weap_xs_vehicle_weapons")
        while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("weap_xs_vehicle_weapons") do
            STREAMING.REQUEST_NAMED_PTFX_ASSET("weap_xs_vehicle_weapons")
            script.yield()
        end
        GRAPHICS.USE_PARTICLE_FX_ASSET("weap_xs_vehicle_weapons")
        local ptfxx = GRAPHICS.START_NETWORKED_PARTICLE_FX_NON_LOOPED_ON_ENTITY("muz_xs_turret_flamethrower_looping", PLAYER.PLAYER_PED_ID(), 0, 0.12, 0.58, 30, 0, 0, 0x8b93, 1, false, false, false)
        GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(ptfxx, 255, 127, 80)
    else
    end

    if  check8:is_enabled() then
        ENTITY.SET_ENTITY_PROOFS(PLAYER.PLAYER_PED_ID(), false, true, false, false, false, false, 1, false)
        if  ptfxAegg == nil then
            local obj1 = 1803116220
    
            local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID())

            STREAMING.REQUEST_MODEL(obj1)
            while not STREAMING.HAS_MODEL_LOADED(obj1) do script.yield() end
             ptfxAegg = OBJECT.CREATE_OBJECT(obj1, pos.x, pos.y, pos.z, true, false, false)

            --ptfxAegg = create_object(obj1, ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID()))
            ENTITY.SET_ENTITY_COLLISION(ptfxAegg, false, false)
            --gui.show_message("","")

            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(obj1)
        end
        for i = 1, #bigfireWings do
            STREAMING.REQUEST_NAMED_PTFX_ASSET("weap_xs_vehicle_weapons")
            while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("weap_xs_vehicle_weapons") do
                STREAMING.REQUEST_NAMED_PTFX_ASSET("weap_xs_vehicle_weapons")
                script.sleep(20)
            end
            GRAPHICS.USE_PARTICLE_FX_ASSET("weap_xs_vehicle_weapons")
            bigfireWings[i].ptfx = GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY("muz_xs_turret_flamethrower_looping", ptfxAegg, 0, 0, 0.1, bigfireWings[i].pos[1], 0, bigfireWings[i].pos[2], 1, false, false, false)
    
                local rot = ENTITY.GET_ENTITY_ROTATION(PLAYER.PLAYER_PED_ID(), 2)
                ENTITY.ATTACH_ENTITY_TO_ENTITY(ptfxAegg, PLAYER.PLAYER_PED_ID(), -1, 0, 0, 0, rot.x, rot.y, rot.z, false, false, false, false, 0, false)
                ENTITY.SET_ENTITY_ROTATION(ptfxAegg, rot.x, rot.y, rot.z, 2, true)
                for i = 1, #bigfireWings do
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_SCALE(bigfireWings[i].ptfx, 0.6)
                    GRAPHICS.SET_PARTICLE_FX_LOOPED_COLOUR(bigfireWings[i].ptfx, 255, 127, 80)
    
                end
                -- ENTITY.SET_ENTITY_VISIBLE(ptfxAegg, false)
    
            
        end
    
    
    else

    end

end)

---------------------------------------------------------------------------------------
