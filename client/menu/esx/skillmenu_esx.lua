----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

if config.resource_settings.menu == 'esx_context' then

    -- Menu event
    RegisterNetEvent('boii_skills:cl:skill_menu', function(skills)
        local elements

        elements = {
            {
                unselectable = true, 
                icon = 'fa-solid fa-bars-progress', 
                description = 'View your characters skill progression here!',
                title = 'Character Skills'
            },
            {
                icon = 'fa-solid fa-dumbbell', 
                title = 'Base Skills', 
                description = 'View your characters base skill progression here!',
                value = 'base_skills'
            },
            {
                icon = 'fa-solid fa-fish', 
                title = 'Civilian Skills',
                description = 'View your characters civilian skill progression here!',
                value = 'civ_skills'
            },
            {
                icon = 'fa-solid fa-people-robbery', 
                title = 'Criminal Skills',
                description = 'View your characters criminal skill progression here!',
                value = 'crim_skills'
            }
        }

        exports['esx_context']:Open('right', elements, function(menu, element)
            local data = {current = element}
            if data.current.value == 'base_skills' then
                TriggerEvent('boii_skills:cl:skill_menus', data.current.value, skills.base_skills)
                return
            end
            if data.current.value == 'civ_skills' then
                TriggerEvent('boii_skills:cl:skill_menus', data.current.value, skills.civ_skills)
                return
            end
            if data.current.value == 'crim_skills' then
                TriggerEvent('boii_skills:cl:skill_menus', data.current.value, skills.crim_skills)
                return
            end
        end)
    end)

    RegisterNetEvent('boii_skills:cl:skill_menus', function(menu, skills)
        local decoded_skills = {}
        for k, v in pairs(skills) do
            decoded_skills[k] = json.decode(v)
        end
        if menu == 'base_skills' then
            local elements = {
                {
                    unselectable = true, 
                    icon = 'fa-solid fa-dumbbell', 
                    title = 'Base Skills',
                    description = 'View your characters base skill progression here!',
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-car', 
                    title = 'Driving', 
                    description = 'Level: '..decoded_skills.driving.level..'<br>Current XP: '..decoded_skills.driving.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-plane', 
                    title = 'Flying', 
                    description = 'Level: '..decoded_skills.flying.level..'<br>Current XP: '..decoded_skills.flying.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-motorcycle', 
                    title = 'Wheelie', 
                    description = 'Level: '..decoded_skills.wheelie.level..'<br>Current XP: '..decoded_skills.wheelie.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-lungs', 
                    title = 'Oxygen', 
                    description = 'Level: '..decoded_skills.oxygen.level..'<br>Current XP: '..decoded_skills.oxygen.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-heart-pulse', 
                    title = 'Stamina', 
                    description = 'Level: '..decoded_skills.stamina.level..'<br>Current XP: '..decoded_skills.stamina.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-person-swimming', 
                    title = 'Swimming', 
                    description = 'Level: '..decoded_skills.swimming.level..'<br>Current XP: '..decoded_skills.swimming.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-person-rifle', 
                    title = 'Shooting', 
                    description = 'Level: '..decoded_skills.shooting.level..'<br>Current XP: '..decoded_skills.shooting.xp
                },
                {
                    icon = 'fa-solid fa-backward', 
                    title = 'Return',
                    value = 'home_menu'
                }
            }
            exports['esx_context']:Open('right', elements, function(menu, element)
                local data = {current = element}
                if data.current.value == 'home_menu' then
                    TriggerEvent('boii_skills:cl:init_menu')
                end
            end)
            return
        end
        if menu == 'civ_skills' then
            local elements = {
                {
                    unselectable = true, 
                    icon = 'fa-solid fa-dumbbell', 
                    title = 'Base Skills',
                    description = 'View your characters base skill progression here!',
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-water-ladder', 
                    title = 'Diving', 
                    description = 'Level: '..decoded_skills.diving.level..'<br>Current XP: '..decoded_skills.diving.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-fish', 
                    title = 'Fishing', 
                    description = 'Level: '..decoded_skills.fishing.level..'<br>Current XP: '..decoded_skills.fishing.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-feather-pointed', 
                    title = 'Hunting', 
                    description = 'Level: '..decoded_skills.hunting.level..'<br>Current XP: '..decoded_skills.hunting.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-pen-ruler', 
                    title = 'Crafting', 
                    description = 'Level: '..decoded_skills.crafting.level..'<br>Current XP: '..decoded_skills.crafting.xp
                },
                {
                    icon = 'fa-solid fa-backward', 
                    title = 'Return',
                    value = 'home_menu'
                }
            }
            exports['esx_context']:Open('right', elements, function(menu, element)
                local data = {current = element}
                if data.current.value == 'home_menu' then
                    TriggerEvent('boii_skills:cl:init_menu')
                end
            end)
            return
        end
        if menu == 'crim_skills' then
            local elements = {
                {
                    unselectable = true, 
                    icon = 'fa-solid fa-dumbbell', 
                    title = 'Base Skills',
                    description = 'View your characters base skill progression here!',
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-flag-checkered', 
                    title = 'Boosting', 
                    description = 'Level: '..decoded_skills.boosting.level..'<br>Current XP: '..decoded_skills.boosting.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-microchip', 
                    title = 'Hacking', 
                    description = 'Level: '..decoded_skills.hacking.level..'<br>Current XP: '..decoded_skills.hacking.xp
                },
                {
                    disabled = true,
                    icon = 'fa-solid fa-unlock', 
                    title = 'Lockpicking', 
                    description = 'Level: '..decoded_skills.lockpick.level..'<br>Current XP: '..decoded_skills.lockpick.xp
                },
                {
                    icon = 'fa-solid fa-backward', 
                    title = 'Return',
                    value = 'home_menu'
                }
            }
            exports['esx_context']:Open('right', elements, function(menu, element)
                local data = {current = element}
                if data.current.value == 'home_menu' then
                    TriggerEvent('boii_skills:cl:init_menu')
                end
            end)
            return
        end
    end)

end