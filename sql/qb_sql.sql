/* CHARACTER SKILLS */
CREATE TABLE IF NOT EXISTS `characters_base_skills` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) NOT NULL,
    `driving` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `flying` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `wheelie` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `oxygen` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `stamina` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `strength` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `swimming` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `shooting` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `stealth` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    PRIMARY KEY (`citizenid`),
    KEY (`id`),
    CONSTRAINT `fk_characters_base_skills_players` FOREIGN KEY (`citizenid`)
    REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `characters_civ_skills` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) NOT NULL,
    `diving` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `fishing` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `hunting` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `crafting` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    PRIMARY KEY (`citizenid`),
    KEY (`id`),
    CONSTRAINT `fk_characters_civ_skills_players` FOREIGN KEY (`citizenid`)
    REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `characters_crim_skills` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `citizenid` varchar(50) NOT NULL,
    `boosting` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `hacking` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    `lockpick` text NOT NULL DEFAULT '{"level": 0, "xp": 0}',
    PRIMARY KEY (`citizenid`),
    KEY (`id`),
    CONSTRAINT `fk_characters_crim_skills_players` FOREIGN KEY (`citizenid`)
    REFERENCES `players` (`citizenid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1;
