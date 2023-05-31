----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- Function to add new players into tables
local function add_new_player(data)
    local identifier
    if framework == 'boii' then
        identifier = {first_name = data.first_name, last_name = data.last_name}

    elseif framework == 'qb' then
        identifier = {citizenid = data.citizenid}

    elseif framework == 'esx' then
        identifier = {identifier = data.identifier}

    elseif framework == 'ox' then
        -- to do ..

    elseif framework == 'custom' then
        -- add code for your own framework here
    end
    local table_names = {
        'characters_base_skills',
        'characters_civ_skills',
        'characters_crim_skills'
    }
    for i, table_name in ipairs(table_names) do
        local result

        if framework == 'boii' then
            local query = 'SELECT * FROM ' .. table_name .. ' WHERE first_name = ? AND last_name = ?'
            result = MySQL.Sync.fetchAll(query, {identifier.first_name, identifier.last_name})

        elseif framework == 'qb' then
            local query = 'SELECT * FROM ' .. table_name .. ' WHERE citizenid = ?'
            result = MySQL.Sync.fetchAll(query, {identifier.citizenid})

        elseif framework == 'esx' then
            local query = 'SELECT * FROM ' .. table_name .. ' WHERE identifier = ?'
            result = MySQL.Sync.fetchAll(query, {identifier.identifier})

        elseif framework == 'ox' then
            -- to do..

        elseif framework == 'custom' then
            -- add code for your own framework here
        end

        if #result == 0 then
            local query = 'INSERT INTO ' .. table_name .. ' SET ?'
            MySQL.Async.execute(query, {identifier})
        end
    end
end

-- Function to import existing players
local function import_players()

    if framework == 'boii' then
        -- probably wont be used due to skills being included as core..
        return
    end

    if framework == 'qb' then
        local query = 'SELECT citizenid FROM players'
        local result = MySQL.Sync.fetchAll(query, {})
        for i=1, #result do
            local citizenid = result[i].citizenid
            local base_skills = 'INSERT INTO characters_base_skills (citizenid) VALUES (?)'
            local civ_skills = 'INSERT INTO characters_civ_skills (citizenid) VALUES (?)'
            local crim_skills = 'INSERT INTO characters_crim_skills (citizenid) VALUES (?)'
            MySQL.Async.execute(base_skills, {citizenid})
            MySQL.Async.execute(civ_skills, {citizenid})
            MySQL.Async.execute(crim_skills, {citizenid})
        end
        return
    end

    if framework == 'esx' then
        local query = 'SELECT identifier FROM users'
        local result = MySQL.Sync.fetchAll(query, {})
        for i=1, #result do
            local identifier = result[i].identifier
            local base_skills = 'INSERT INTO characters_base_skills (identifier) VALUES (?)'
            local civ_skills = 'INSERT INTO characters_civ_skills (identifier) VALUES (?)'
            local crim_skills = 'INSERT INTO characters_crim_skills (identifier) VALUES (?)'
            MySQL.Async.execute(base_skills, {identifier})
            MySQL.Async.execute(civ_skills, {identifier})
            MySQL.Async.execute(crim_skills, {identifier})
        end
        return
    end

    if framework == 'ox' then
        -- to do ..
        return
    end

    if framework == 'custom' then
        -- to do ..
        return
    end

end

-- Function to get table name from skill_type
local function get_table_name(skill_type)
    local table_map = {
        base_skills = 'characters_base_skills',
        civ_skills = 'characters_civ_skills',
        crim_skills = 'characters_crim_skills'
    }
    return table_map[skill_type]
end

-- Function to add new skill column
local function add_skill(skill_type, skill_name)
    local table_name = get_table_name(skill_type)
    local query = string.format('ALTER TABLE %s ADD COLUMN %s text NOT NULL DEFAULT \'{"level": 0, "xp": 0}\'', table_name, skill_name)
    MySQL.Async.execute(query)
end

-- Get character skills
local function get_skills(data)
    local data_map = {
        base_skills = 'characters_base_skills',
        civ_skills = 'characters_civ_skills',
        crim_skills = 'characters_crim_skills'
    }
    local function get_skill_data(table_name)
        
        -- boii_base
        if framework == 'boii' then
            local query = 'SELECT * FROM ' .. table_name .. ' WHERE first_name = ? AND last_name = ?'
            local result = MySQL.query.await(query, {data.first_name, data.last_name})
            if result and #result > 0 then
                return result[1]
            else
                return {}
            end
        end

        -- qb-core
        if framework == 'qb' then
            local query = 'SELECT * FROM ' .. table_name .. ' WHERE citizenid = ?'
            local result = MySQL.query.await(query, {data.citizenid})
            if result and #result > 0 then
                return result[1]
            else
                return {}
            end
        end

        -- esx legacy
        if framework == 'esx' then
            local query = 'SELECT * FROM ' .. table_name .. ' WHERE identifier = ?'
            local result = MySQL.query.await(query, {data.identifier})
            if result and #result > 0 then
                return result[1]
            else
                return {}
            end
        end

        -- ox_core
        if framework == 'ox' then
            -- to do ..
        end

        -- custom
        if framework == 'custom' then
            -- add code for your own framework here
        end

    end
    local base_skills = get_skill_data(data_map.base_skills)
    local civ_skills = get_skill_data(data_map.civ_skills)
    local crim_skills = get_skill_data(data_map.crim_skills)
    return base_skills, civ_skills, crim_skills
end

-- Function to save skills to database
local function save_skills_to_database(identifier, skill_type, skill_name, new_skill_data)
    local table_name = get_table_name(skill_type)

    -- boii_base
    if framework == 'boii' then
        local query = 'UPDATE ' .. table_name .. ' SET ' .. skill_name .. ' = ? WHERE first_name = ? AND last_name = ?'
        MySQL.Async.execute(query, {new_skill_data, identifier.first_name, identifier.last_name})
        return
    end
    
    -- qb-core
    if framework == 'qb' then
        local query = 'UPDATE ' .. table_name .. ' SET ' .. skill_name .. ' = ? WHERE citizenid = ?'
        MySQL.Async.execute(query, {new_skill_data, identifier.citizenid})
        return
    end

    -- esx legacy
    if framework == 'esx' then
        local query = 'UPDATE ' .. table_name .. ' SET ' .. skill_name .. ' = ? WHERE identifier = ?'
        MySQL.Async.execute(query, {new_skill_data, identifier.identifier})
        return
    end

    -- esx legacy
    if framework == 'ox' then
        -- to do ..
        return
    end

    -- custom
    if framework == 'custom' then
         -- add code for your own framework here
        return
    end
end

-- Function to calculate the amount of XP required for the next level
local function experience_required_for_level(level)
    local base_xp = skill_experience_defaults.base_xp
    local growth_factor = skill_experience_defaults.growth_factor
    local xp_required = math.floor(base_xp * (math.pow(growth_factor, level - 1)))
    return xp_required
end

-- Function to update xp
local function update_xp(identifier, skill_type, skill_name, action, xp_change)
    local base_skills, civ_skills, crim_skills = get_skills(identifier)
    local skill_table = {
        base_skills = base_skills,
        civ_skills = civ_skills,
        crim_skills = crim_skills
    }
    local skill_json = skill_table[skill_type][skill_name]
    local skill_data = skill_json and json.decode(skill_json)
    local current_xp = skill_data.xp
    local current_level = skill_data.level
    local new_xp
    if action == "add" then
        new_xp = current_xp + xp_change
    elseif action == "remove" then
        new_xp = math.max(current_xp - xp_change, 0)
    else
        return false
    end
    local new_level = current_level
    while new_xp >= experience_required_for_level(new_level + 1) do
        new_level = new_level + 1
    end
    while new_xp < experience_required_for_level(new_level) and new_level > 0 do
        new_level = new_level - 1
    end
    skill_data.xp = new_xp
    skill_data.level = new_level
    skill_table[skill_type][skill_name] = json.encode(skill_data)
    save_skills_to_database(identifier, skill_type, skill_name, skill_table[skill_type][skill_name])
    return true
end


--<!>-- framework settings --<!>--
-- boii_base
if framework == 'boii' then

    -- callbacks
    fw.util.create_server_callback('boii_skills:sv:callback_skills', function(source, cb)
        local player = fw.s_data.get_user(source)
        if not player then
            print('no player found')
            return
        end
        local identifier = {first_name = player.c_data.first_name, last_name = player.c_data.last_name}
        local base_skills, civ_skills, crim_skills = get_skills(identifier)
        cb(base_skills, civ_skills, crim_skills)
    end)
    -- commands
    fw.commands.register_command('skills:import_players', {'admin'}, 'Import players into database skill tables.', {}, function(source, args, raw)
        import_players()
    end)
    
    fw.commands.register_command('skills:add_skill', {'admin'}, 'Add a new skill to the database skill tables.', {{name = 'skill_table', help = 'options: base_skills, civ_skills, crim_skills'}, {name = 'skill_name', help = 'name of skill to add'}}, function(source, args, raw)
        local skill_table = tostring(args[1]):lower()
        local skill_name = tostring(args[2]):lower()
        add_skill(skill_table, skill_name)
    end)

    return
end

-- qb-core
if framework == 'qb' then

    -- callbacks
    fw.Functions.CreateCallback('boii_skills:sv:callback_skills', function(source, cb)
        local player = fw.Functions.GetPlayer(source)
        if not player then
            print('no player found')
            return
        end
        local identifier = {citizenid = player.PlayerData.citizenid}
        local base_skills, civ_skills, crim_skills = get_skills(identifier)
        cb(base_skills, civ_skills, crim_skills)
    end)

    -- commands
    fw.Commands.Add('skills:import_players', 'Import players into database skill tables', {}, false, function(source)
        import_players()
    end, 'admin')

    fw.Commands.Add('skills:add_skill', 'Add a new skill to database skill tables', {{name = 'skill_table', help = 'options: base_skills, civ_skills, crim_skills'}, {name = 'skill_name', help = 'name of skill to add'}}, false, function(source, args, raw)
        local skill_table = tostring(args[1]):lower()
        local skill_name = tostring(args[2]):lower()
        add_skill(skill_table, skill_name)
    end, 'admin')

    return
end

-- esx legacy
if framework == 'esx' then
    -- events
    AddEventHandler('esx:playerLoaded', function(source) 
        local player = fw.GetPlayerFromId(source)
        if not player then
            print('no player found')
            return
        end
        local identifier = {identifier = player.identifier}
        add_new_player(identifier)
    end)

    -- callbacks
    fw.RegisterServerCallback('boii_skills:sv:callback_skills', function(source, cb)
		local player = fw.GetPlayerFromId(source)
        if not player then
            print('no player found')
            return
        end
        local identifier = {identifier = player.identifier}
        local base_skills, civ_skills, crim_skills = get_skills(identifier)
        cb(base_skills, civ_skills, crim_skills)
	end)

    -- commands
    fw.RegisterCommand({'skills:import_players'}, 'admin', function(xPlayer, args, showError)
        import_players()
    end, true, {help = 'Import players into database skill tables'})

    fw.RegisterCommand('skills:add_skill', 'admin', function(xPlayer, args, showError)
        local skill_table = tostring(args[1]):lower()
        local skill_name = tostring(args[2]):lower()
        add_skill(skill_table, skill_name)
    end, false, {help = 'Add a new skill to database skill tables', validate = true, arguments = {
        {name = 'skill_table', help = 'options: base_skills, civ_skills, crim_skills', type = 'string'},
        {name = 'skill_name', help = 'name of skill to add', type = 'string'}
    }})

    return
end

-- ox_core
if framework == 'ox' then

    -- to do..

    return
end


-- custom
if framework == 'custom' then

    -- add code for your own framework here

    return
end

-- Exports
exports('add_new_player', add_new_player)
exports('get_skills', get_skills)
exports('update_xp', update_xp)
exports('add_skill', add_skill)
