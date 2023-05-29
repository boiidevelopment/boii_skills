----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

player_skills = {}

RegisterNetEvent('boii_skills:cl:init_menu', function()
    if framework == 'boii' then
        local response = fw.util.trigger_server_callback('boii_skills:sv:callback_skills')
        local base_skills, civ_skills, crim_skills = table.unpack(response)
        if base_skills ~= nil and civ_skills ~= nil and crim_skills ~= nil then
            player_skills.base_skills = base_skills
            player_skills.civ_skills = civ_skills
            player_skills.crim_skills = crim_skills           
            TriggerEvent('boii_skills:cl:skill_menu', player_skills)
        end
    elseif framework == 'qb' then
        fw.Functions.TriggerCallback('boii_skills:sv:callback_skills',function(base_skills, civ_skills, crim_skills)
            if base_skills ~= nil and civ_skills ~= nil and crim_skills ~= nil then
                player_skills.base_skills = base_skills
                player_skills.civ_skills = civ_skills
                player_skills.crim_skills = crim_skills
                TriggerEvent('boii_skills:cl:skill_menu', player_skills)
            end
        end)
    end
end)

RegisterCommand('openskillmenu', function()
    TriggerEvent('boii_skills:cl:init_menu')
end)
