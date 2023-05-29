----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'cerulean'

game 'gta5'

author 'CASE#1993'

description 'BOII | Development - Utility: Skill System*(W.I.P)*'

version '0.0.1'

lua54 'yes'

client_scripts {
    'client/**/*',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*'
}
shared_scripts {
    'shared/*'
}
escrow_ignore {
    'client/**/*',
    'server/*',
    'shared/*'
}