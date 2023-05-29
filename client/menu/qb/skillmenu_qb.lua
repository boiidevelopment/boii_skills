----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

if config.resource_settings.menu == 'qb-menu' then

    RegisterNetEvent('boii_skills:cl:skill_menu', function(skills)
        local main_menu = {
            {
                header = 'Character Skills',
                txt = 'View your characters skill progression.',
                icon = 'fa-solid fa-bars-progress',
                isMenuHeader = true
            },
            {
                header = 'Base Skills',
                txt = 'View your characters base skill progression here!',
                icon = 'fa-solid fa-dumbbell',
                params = {
                    event = 'boii_skills:cl:skill_menus',
                    args = {
                        menu = 'base',
                        skills = skills.base_skills
                    }
                }
            },
            {
                header = 'Civilian Skills',
                txt = 'View your characters civilian skill progression here!',
                icon = 'fa-solid fa-fish',
                params = {
                    event = 'boii_skills:cl:skill_menus',
                    args = {
                        menu = 'civ',
                        skills = skills.civ_skills
                    }
                }
            },
            {
                header = 'Criminal Skills',
                txt = 'View your characters criminal skill progression here!',
                icon = 'fa-solid fa-people-robbery',
                params = {
                    event = 'boii_skills:cl:skill_menus',
                    args = {
                        menu = 'crim',
                        skills = skills.crim_skills
                    }
                }
            },
        }
        exports['qb-menu']:openMenu(main_menu)
    end)
    
    RegisterNetEvent('boii_skills:cl:skill_menus', function(args)
        local menu = args.menu
        local skills = args.skills
        local decoded_skills = {}
        for k, v in pairs(skills) do
            decoded_skills[k] = json.decode(v)
        end
        if menu == 'base' then
            -- Base skills
            local base_skills = {
                {
                    header = 'Base Skills',
                    txt = 'View your characters base skill progression here!',
                    icon = 'fa-solid fa-dumbbell',
                    isMenuHeader = true
                },
                {
                    header = 'Driving',
                    txt = 'Level: '..decoded_skills.driving.level..'<br>Current XP: '..decoded_skills.driving.xp,
                    icon = 'fa-solid fa-car',
                    params = {}
                },
                {
                    header = 'Flying',
                    txt = 'Level: '..decoded_skills.flying.level..'<br>Current XP: '..decoded_skills.flying.xp,
                    icon = 'fa-solid fa-plane',
                    params = {}
                },
                {
                    header = 'Wheelie',
                    txt = 'Level: '..decoded_skills.wheelie.level..'<br>Current XP: '..decoded_skills.wheelie.xp,
                    icon = 'fa-solid fa-motorcycle',
                    params = {}
                },
                {
                    header = 'Oxygen',
                    txt = 'Level: '..decoded_skills.oxygen.level..'<br>Current XP: '..decoded_skills.oxygen.xp,
                    icon = 'fa-solid fa-lungs',
                    params = {}
                },
                {
                    header = 'Stamina',
                    txt = 'Level: '..decoded_skills.stamina.level..'<br>Current XP: '..decoded_skills.stamina.xp,
                    icon = 'fa-solid fa-heart-pulse',
                    params = {}
                },
                {
                    header = 'Strength',
                    txt = 'Level: '..decoded_skills.strength.level..'<br>Current XP: '..decoded_skills.strength.xp,
                    icon = 'fa-solid fa-dumbbell',
                    params = {}
                },
                {
                    header = 'Swimming',
                    txt = 'Level: '..decoded_skills.swimming.level..'<br>Current XP: '..decoded_skills.swimming.xp,
                    icon = 'fa-solid fa-user-ninja',
                    params = {}
                },
                {
                    header = 'Shooting',
                    txt = 'Level: '..decoded_skills.shooting.level..'<br>Current XP: '..decoded_skills.shooting.xp,
                    icon = 'fa-solid fa-user-ninja',
                    params = {}
                },
                {
                    header = 'Stealth',
                    txt = 'Level: '..decoded_skills.stealth.level..'<br>Current XP: '..decoded_skills.stealth.xp,
                    icon = 'fa-solid fa-user-ninja',
                    params = {}
                },
                {
                    header = 'Return',
                    icon = 'fa-solid fa-backward',
                    params = {
                        event = 'boii_skills:cl:init_menu'
                    }
                }
            }
            exports['qb-menu']:openMenu(base_skills)
            return
        end
        if menu == 'civ' then
            -- civ skills
            local civ_skills = {
                {
                    header = 'Civilian Skills',
                    txt = 'View your characters civilian skill progression here!',
                    icon = 'fa-solid fa-dumbbell',
                    isMenuHeader = true
                },
                {
                    header = 'Diving',
                    txt = 'Level: '..decoded_skills.diving.level..'<br>Current XP: '..decoded_skills.diving.xp,
                    icon = 'fa-solid fa-water-ladder',
                    params = {}
                },
                {
                    header = 'Fishing',
                    txt = 'Level: '..decoded_skills.fishing.level..'<br>Current XP: '..decoded_skills.fishing.xp,
                    icon = 'fa-solid fa-fish',
                    params = {}
                },
                {
                    header = 'Hunting',
                    txt = 'Level: '..decoded_skills.hunting.level..'<br>Current XP: '..decoded_skills.hunting.xp,
                    icon = 'fa-solid fa-feather-pointed',
                    params = {}
                },
                {
                    header = 'Crafting',
                    txt = 'Level: '..decoded_skills.crafting.level..'<br>Current XP: '..decoded_skills.crafting.xp,
                    icon = 'fa-solid fa-pen-ruler',
                    params = {}
                },
                {
                    header = 'Return',
                    icon = 'fa-solid fa-backward',
                    params = {
                        event = 'boii_skills:cl:init_menu'
                    }
                }
            }
            exports['qb-menu']:openMenu(civ_skills)
            return
        end
        if menu == 'crim' then
            -- Crim skills
            local crim_skills = {
                {
                    header = 'Criminal Skills',
                    txt = 'View your characters criminal skill progression here!',
                    icon = 'fa-solid fa-dumbbell',
                    isMenuHeader = true
                },
                {
                    header = 'Boosting',
                    txt = 'Level: '..decoded_skills.boosting.level..'<br>Current XP: '..decoded_skills.boosting.xp,
                    icon = 'fa-solid fa-flag-checkered',
                    params = {}
                },
                {
                    header = 'Hacking',
                    txt = 'Level: '..decoded_skills.hacking.level..'<br>Current XP: '..decoded_skills.hacking.xp,
                    icon = 'fa-solid fa-microchip',
                    params = {}
                },
                {
                    header = 'Lockpicking',
                    txt = 'Level: '..decoded_skills.lockpick.level..'<br>Current XP: '..decoded_skills.lockpick.xp,
                    icon = 'fa-solid fa-unlock',
                    params = {}
                },
                {
                    header = 'Return',
                    icon = 'fa-solid fa-backward',
                    params = {
                        event = 'boii_skills:cl:init_menu'
                    }
                }
            }
            exports['qb-menu']:openMenu(crim_skills)
            return
        end
    end)
end