----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- player skills
player_skills = {}

-- event to init player skills into menu
RegisterNetEvent('boii_skills:cl:init_menu', function()

    if framework == 'boii' then
        local response = fw.util.trigger_server_callback('boii_skills:sv:callback_skills')
        local base_skills, civ_skills, crim_skills = table.unpack(response)
        if base_skills == nil or civ_skills == nil or crim_skills == nil then
            print('callback failed skills not found')
            return
        end
        player_skills.base_skills = base_skills
        player_skills.civ_skills = civ_skills
        player_skills.crim_skills = crim_skills           
        TriggerEvent('boii_skills:cl:skill_menu', player_skills)
        return
    end

    if framework == 'qb' then
        fw.Functions.TriggerCallback('boii_skills:sv:callback_skills',function(base_skills, civ_skills, crim_skills)
            if base_skills == nil or civ_skills == nil or crim_skills == nil then
                print('callback failed skills not found')
                return
            end
            player_skills.base_skills = base_skills
            player_skills.civ_skills = civ_skills
            player_skills.crim_skills = crim_skills
            TriggerEvent('boii_skills:cl:skill_menu', player_skills)
        end)
        return
    end

    if framework == 'esx' then
        fw.TriggerServerCallback('boii_skills:sv:callback_skills', function(base_skills, civ_skills, crim_skills)
            if base_skills == nil or civ_skills == nil or crim_skills == nil then
                print('callback failed skills not found')
                return
            end
            player_skills.base_skills = base_skills
            player_skills.civ_skills = civ_skills
            player_skills.crim_skills = crim_skills
            TriggerEvent('boii_skills:cl:skill_menu', player_skills)
        end)
        return
    end

    if framework == 'ox' then
        -- to do ..
        return
    end

    if framework == 'custom' then
        -- add code for your own framework here
        return
    end
end)

-- command to open menu
RegisterCommand('openskillmenu', function()
    TriggerEvent('boii_skills:cl:init_menu')
end)
