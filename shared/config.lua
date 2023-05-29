----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

config = config or {}

-- framework settings
config.framework = 'qb' -- options; boii, qb

-- resource settings
config.resource_settings = {
    menu = 'qb-menu', -- options; boii_ui, qb-menu
}

-- skill settings
config.skills = {
    defaults = {
        base_xp = 100, -- base xp required for level 0 - 1
        growth_factor = 1.5 -- xp growth factor e.g. level 0 - 1 = 100xp, 1 - 2 = 150, 2 - 3 = 225, 3 - 4 = 337, 4 - 5 = 506...
    }
}
