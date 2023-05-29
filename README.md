----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

# BOII | DEVELOPMENT - UTILITY; SKILL SYSTEM (W.I.P)

Here we have a simple skill system you can use within your city. 
System is SQL based and entirely standalone.
Infinitely expandable and easy to set up.
Enjoy!

### INSTALL

1. Customise `shared/config.lua`, `client/menu/*`, and `sql/""_sql.sql` to your liking
2. Drag and drop `boii_skills` into your servers resources ensuring your load order is correct
3. Add `ensure boii_skills` to your server.cfg if you are not launching categories 
4. If you are using `qb-core` follow the instructions inside `readme/qbcore-edits.md` additional frameworks to come
5. Restart your server

### API

- Add player
- Use this export to add new characters into the tables refer to framework relevant readmes for example
```lua
exports['boii_skills']:add_new_player({identifier})
```

- Import players command
- Use this command to import your existing players into the new skills tables.

`/skills:import_players`

- Get skills
- Use this export to get a players current skill data

```lua
exports['boii_skills']:get_skills(identifier)
```

- Update XP
- Use this export to update a players xp

```lua
exports['boii_skills']:update_xp(identifier, skill_type, skill_name, action, xp_change)
```

- Add skill
- Use this export to add a new skill into the sql tables

```lua
exports['boii_skills']:add_skill(skill_type, skill_name)
```

### PREVIEW
coming soon..

### SUPPORT
https://discord.gg/boiidevelopment
