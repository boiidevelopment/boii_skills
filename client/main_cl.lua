----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

framework = config.framework

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