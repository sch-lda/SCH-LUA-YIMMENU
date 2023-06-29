function upgrade_vehicle(vehicle)
    for i = 0, 49 do
        local num = VEHICLE.GET_NUM_VEHICLE_MODS(vehicle, i)
        VEHICLE.SET_VEHICLE_MOD(vehicle, i, num - 1, true)
    end
end

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("SCH LUA(测试)") 
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("任务功能") 

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("佩里科终章一键完成", function()
    locals.set_int("fm_mission_controller_2020","46829","50")
    locals.set_int("fm_mission_controller_2020","45450","9")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("一键配置前置(猎豹雕像)", function()
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_TARGET"), 5, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_BS_GEN"), 131071, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_BS_ENTR"), 63, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_APPROACH"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_WEAPONS"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_WEP_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_ARM_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_HEL_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_GOLD_C"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_GOLD_C_SCOPED"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_PAINT_SCOPED"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_PAINT"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_GOLD_V"), 585151, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_PAINT_V"), 438863, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4_PROGRESS"), 124271, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4_MISSIONS"), 65279, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_COKE_I_SCOPED"), 16777215, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_COKE_I"), 16777215, true)

    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_TARGET"), 5, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_BS_GEN"), 131071, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_BS_ENTR"), 63, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_APPROACH"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_WEAPONS"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_WEP_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_ARM_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_HEL_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_GOLD_C"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_GOLD_C_SCOPED"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_PAINT_SCOPED"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_PAINT"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_GOLD_V"), 585151, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_PAINT_V"), 438863, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4_PROGRESS"), 124271, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4_MISSIONS"), 65279, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_COKE_I_SCOPED"), 16777215, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_COKE_I"), 16777215, true)

    gui.show_message("写入完成", "远离计划面板并重新接近以刷新面板")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("一键配置前置(粉钻)", function()
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_TARGET"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_BS_GEN"), 131071, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_BS_ENTR"), 63, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_APPROACH"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_WEAPONS"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_WEP_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_ARM_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4CNF_HEL_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_GOLD_C"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_GOLD_C_SCOPED"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_PAINT_SCOPED"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_PAINT"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_GOLD_V"), 585151, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_PAINT_V"), 438863, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4_PROGRESS"), 124271, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4_MISSIONS"), 65279, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_COKE_I_SCOPED"), 16777215, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_H4LOOT_COKE_I"), 16777215, true)

    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_TARGET"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_BS_GEN"), 131071, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_BS_ENTR"), 63, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_APPROACH"), -1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_WEAPONS"), 1, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_WEP_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_ARM_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4CNF_HEL_DISRP"), 3, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_GOLD_C"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_GOLD_C_SCOPED"), 255, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_PAINT_SCOPED"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_PAINT"), 127, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_GOLD_V"), 585151, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_PAINT_V"), 438863, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4_PROGRESS"), 124271, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4_MISSIONS"), 65279, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_COKE_I_SCOPED"), 16777215, true)
    STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_H4LOOT_COKE_I"), 16777215, true)

    gui.show_message("写入完成", "远离计划面板并重新接近以刷新面板")

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

    local firework_box = OBJECT.CREATE_OBJECT(3176209716, pos.x,pos.y,pos.z, true, false, false)
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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("中高风险功能") 

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("CEO仓库出货一键完成", function()
    locals.set_int("gb_contraband_sell","542","99999")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("摩托帮出货一键完成", function()
    locals.set_int("gb_biker_contraband_sell","821","30")
end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("夜总会保险箱30万循环10次", function()
    a2 =0
    while a2 < 10 do
        a2 = a2 + 1
        gui.show_message("已执行次数", a2)
        globals.set_int(262145 + 24227,300000)
        globals.set_int(262145 + 24223,300000)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_CLUB_POPULARITY"), 10000, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_CLUB_PAY_TIME_LEFT"), -1, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP0_CLUB_POPULARITY"), 100000, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_CLUB_POPULARITY"), 10000, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_CLUB_PAY_TIME_LEFT"), -1, true)
        STATS.STAT_SET_INT(MISC.GET_HASH_KEY("MP1_CLUB_POPULARITY"), 100000, true)
        gui.show_message("警告", "此方法仅用于偶尔小额恢复")

        script.sleep(10000)
    
    end
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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("杂项")

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("预览万圣节猎鬼活动", function()
    globals.set_int(262145+35064,1) --Ghost hunt enable
    globals.set_int(262145+35158,50000) --Ghost hunt GHOSTHUNT_CASH_REWARD
    gui.show_message("鬼将随机生成在某个位置","该活动只发生在晚八点至次日凌晨六点")
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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_separator()
gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_text("玩家选项-请在Yim玩家列表选择玩家") 


gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("栅栏笼子", function()
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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("竞技管笼子", function()
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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("保险箱笼子", function()
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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("电击", function()

    local pos = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)
    MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS(pos.x, pos.y, pos.z + 1, pos.x, pos.y, pos.z, 1000, true, MISC.GET_HASH_KEY("weapon_stungun"), false, false, true, 1.0)

end)

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("轰炸", function()

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

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_sameline()

gui.get_tab("GUI_TAB_LUA_SCRIPTS"):add_button("测试1", function()
    local CrashModel = MISC.GET_HASH_KEY("prop_fragtest_cnst_04")
    local Coords = ENTITY.GET_ENTITY_COORDS(PLAYER.GET_PLAYER_PED(network.get_selected_player()), false)

    TASK.CLEAR_PED_TASKS_IMMEDIATELY(Ped)
    TASK.CLEAR_PED_SECONDARY_TASK(Ped)
    gui.show_message("test",os.time())

    os.time()
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


