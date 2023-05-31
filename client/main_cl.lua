----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

framework = config.framework

if framework == 'boii' then
    fw = exports['boii_base']:get_objects()
elseif framework == 'qb' then
    fw = exports['qb-core']:GetCoreObject()
elseif framework == 'esx' then
    fw = exports['es_extended']:getSharedObject()
elseif framework == 'ox' then    
    -- to do...
elseif framework == 'custom' then
    -- add code for your own framework here
end
