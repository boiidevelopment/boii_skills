----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

if config.resource_settings.menu == 'boii_ui' then

    -- Menu event
    RegisterNetEvent('boii_skills:cl:skill_menu', function(skills)
        -- Main menu
        local main_menu = {
            main_header = { -- Main menu header
                text = 'Character Skills',
                icon = '<i class="fa-solid fa-bars-progress"></i>'
            },
            menu_options = {
                {
                    header = 'Base Skills',
                    header_icon = '<i class="fa-solid fa-dumbbell"></i>',
                    message = 'View your characters base skill progression here!',
                    action_type = 'client_event',
                    action = 'boii_skills:cl:skill_menus',
                    params = {
                        args = {
                            menu = 'base',
                            skills = skills.base_skills
                        }
                    },
                    should_close = false,
                    disabled = false
                },
                {
                    header = 'Civilian Skills',
                    header_icon = '<i class="fa-solid fa-fish"></i>',
                    message = 'View your characters civilian skill progression here!',
                    action_type = 'client_event',
                    action = 'boii_skills:cl:skill_menus',
                    params = {
                        args = {
                            menu = 'civ',
                            skills = skills.civ_skills
                        }
                    },
                    should_close = false,
                    disabled = false
                },
                {
                    header = 'Criminal Skills',
                    header_icon = '<i class="fa-solid fa-people-robbery"></i>',
                    message = 'View your characters criminal skill progression here!',
                    action_type = 'client_event',
                    action = 'boii_skills:cl:skill_menus',
                    params = {
                        args = {
                            menu = 'crim',
                            skills = skills.crim_skills
                        }
                    },
                    should_close = false,
                    disabled = false
                },
            },
            menu_buttons = {
                close = {
                    use = true,
                    text = 'Exit',
                    action_type = 'client_event',
                    action = 'boii_skills:cl:stop_menu',
                    params = {},
                    should_close = true
                }
            },
        }

        exports['boii_ui']:open_menu('default', main_menu)
    end)

    RegisterNetEvent('boii_skills:cl:skill_menus', function(params)
        local menu = params.args.menu
        local skills = params.args.skills
        local decoded_skills = {}
        for k, v in pairs(skills) do
            decoded_skills[k] = json.decode(v)
        end
        if menu == 'base' then
            -- Base skills
            local base_skills = {
                main_header = { -- Main menu header
                    text = 'Base Skills',
                    icon = '<i class="fa-solid fa-dumbbell"></i>'
                },
                menu_options = {
                    {
                        header = 'Driving',
                        header_icon = '<i class="fa-solid fa-car"></i>',
                        message = 'Level: '..decoded_skills.driving.level..'<br>Current XP: '..decoded_skills.driving.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Flying',
                        header_icon = '<i class="fa-solid fa-plane"></i>',
                        message = 'Level: '..decoded_skills.flying.level..'<br>Current XP: '..decoded_skills.flying.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Wheelie',
                        header_icon = '<i class="fa-solid fa-motorcycle"></i>',
                        message = 'Level: '..decoded_skills.wheelie.level..'<br>Current XP: '..decoded_skills.wheelie.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Oxygen',
                        header_icon = '<i class="fa-solid fa-lungs"></i>',
                        message = 'Level: '..decoded_skills.oxygen.level..'<br>Current XP: '..decoded_skills.oxygen.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Stamina',
                        header_icon = '<i class="fa-solid fa-heart-pulse"></i>',
                        message = 'Level: '..decoded_skills.stamina.level..'<br>Current XP: '..decoded_skills.stamina.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Strength',
                        header_icon = '<i class="fa-solid fa-dumbbell"></i>',
                        message = 'Level: '..decoded_skills.strength.level..'<br>Current XP: '..decoded_skills.strength.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Swimming',
                        header_icon = '<i class="fa-solid fa-person-swimming"></i>',
                        message = 'Level: '..decoded_skills.swimming.level..'<br>Current XP: '..decoded_skills.swimming.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Shooting',
                        header_icon = '<i class="fa-solid fa-person-rifle"></i>',
                        message = 'Level: '..decoded_skills.shooting.level..'<br>Current XP: '..decoded_skills.shooting.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Stealth',
                        header_icon = '<i class="fa-solid fa-user-ninja"></i>',
                        message = 'Level: '..decoded_skills.stealth.level..'<br>Current XP: '..decoded_skills.stealth.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                },
                menu_buttons = {
                    close = {
                        use = true,
                        text = 'Return',
                        action_type = 'client_event',
                        action = 'boii_skills:cl:init_menu',
                        params = {},
                        should_close = true
                    }
                },
            }
            exports['boii_ui']:open_menu('default', base_skills)
            return
        end
        if menu == 'civ' then
            -- Civilian skills
            local civ_skills = {
                main_header = { -- Main menu header
                    text = 'Civilian Skills',
                    icon = '<i class="fa-solid fa-dumbbell"></i>'
                },
                menu_options = {
                    {
                        header = 'Diving',
                        header_icon = '<i class="fa-solid fa-water-ladder"></i>',
                        message = 'Level: '..decoded_skills.diving.level..'<br>Current XP: '..decoded_skills.diving.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Fishing',
                        header_icon = '<i class="fa-solid fa-fish"></i>',
                        message = 'Level: '..decoded_skills.fishing.level..'<br>Current XP: '..decoded_skills.fishing.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Hunting',
                        header_icon = '<i class="fa-solid fa-feather-pointed"></i>',
                        message = 'Level: '..decoded_skills.hunting.level..'<br>Current XP: '..decoded_skills.hunting.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Crafting',
                        header_icon = '<i class="fa-solid fa-pen-ruler"></i>',
                        message = 'Level: '..decoded_skills.crafting.level..'<br>Current XP: '..decoded_skills.crafting.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                },
                menu_buttons = {
                    close = {
                        use = true,
                        text = 'Return',
                        action_type = 'client_event',
                        action = 'boii_skills:cl:init_menu',
                        params = {},
                        should_close = true
                    }
                },
            }
            exports['boii_ui']:open_menu('default', civ_skills)
            return
        end
        if menu == 'crim' then
            -- Criminal skills
            local crim_skills = {
                main_header = { -- Main menu header
                    text = 'Criminal Skills',
                    icon = '<i class="fa-solid fa-fish"></i>'
                },
                menu_options = {
                    {
                        header = 'Boosting',
                        header_icon = '<i class="fa-solid fa-flag-checkered"></i>',
                        message = 'Level: '..decoded_skills.boosting.level..'<br>Current XP: '..decoded_skills.boosting.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Hacking',
                        header_icon = '<i class="fa-solid fa-microchip"></i>',
                        message = 'Level: '..decoded_skills.hacking.level..'<br>Current XP: '..decoded_skills.hacking.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                    {
                        header = 'Lockpicking',
                        header_icon = '<i class="fa-solid fa-unlock"></i>',
                        message = 'Level: '..decoded_skills.lockpick.level..'<br>Current XP: '..decoded_skills.lockpick.xp,
                        action_type = 'client_event',
                        action = '',
                        params = {},
                        should_close = false,
                        disabled = true
                    },
                },
                menu_buttons = {
                    close = {
                        use = true,
                        text = 'Return',
                        action_type = 'client_event',
                        action = 'boii_skills:cl:init_menu',
                        params = {},
                        should_close = true
                    }
                },
            }
            exports['boii_ui']:open_menu('default', crim_skills)
            return
        end
    end)
    

end