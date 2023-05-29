----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

framework = config.framework
skill_experience_defaults = config.skills.defaults

if framework == 'boii' then
    fw = exports['boii_base']:get_objects()
elseif framework == 'qb' then
    fw = exports['qb-core']:GetCoreObject()
elseif framework == 'esx' then
    -- to do ...
elseif framework == 'ox' then    
    -- to do...
elseif framework == 'custom' then
    -- to do...
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('^5--<^3!^5>-- ^7BOII ^5| ^7DEVELOPMENT ^5--<^3!^5>-- ^7UTILITY: SKILL SYSTEM V0.0.1 ^5--<^3!^5>--^7')
end)