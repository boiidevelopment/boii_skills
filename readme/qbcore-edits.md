----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

### QB-CORE EDITS

In order to ensure new characters are added into the skills tables you can add the following export into your `qb-core/server/player.lua`

- Export

```lua

exports['boii_skills']:add_new_player({citizenid = self.PlayerData.citizenid})

```

- Where to place
- Search for `QBCore.Functions.CreatePlayer` and find the following section and add in the export as shown below

```lua

    else
        QBCore.Players[self.PlayerData.source] = self
        QBCore.Player.Save(self.PlayerData.source)

        -- At this point we are safe to emit new instance to third party resource for load handling
        TriggerEvent('QBCore:Server:PlayerLoaded', self)
	    exports['boii_skills']:add_new_player({citizenid = self.PlayerData.citizenid})
        self.Functions.UpdatePlayerData()
    end

```