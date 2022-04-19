local mType = Game.createMonsterType("Ice serpente")
local monster = {}

monster.name = "Ice serpente"
monster.description = "a Ice serpente"
monster.experience = 23000
monster.outfit = {
	lookType = 275,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 23200
monster.maxHealth = 23200
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 8307
monster.speed = 350
monster.summonCost = 390

monster.changeTarget = {
	interval = 2000,
	chance = 50
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = true,
	convinceable = true,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 85,
	targetDistance = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 3000,
	chance = 20,
	{text = "CHHHRRRR", yell = false},
	{text = "HISSSS", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 90},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 115, attack = 110},
	{name ="combat", interval = 1000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -805, length = 9, spread = 3, effect = CONST_ME_BIGPLANTS},
	{name ="combat", interval = 1500, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -800, maxDamage = -900, radius = 8, target = false, effect = CONST_ME_GIANTICE},
	{name ="combat", interval = 1000, chance = 7, type = COMBAT_ICEDAMAGE, minDamage = -900, maxDamage = -1000, length = 9, spread = 3, effect = CONST_ME_ICEAREA},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -650, maxDamage = -880, length = 8, spread = 0, effect = CONST_ME_SOUND_RED}
}

monster.defenses = {
	defense = 20,
	armor = 16,
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2148, chance = 4000, maxCount = 71},
	{id = 2146, chance = 1000},
	{id = 2666, chance = 2000, maxCount = 4},
	{id = 2214, chance = 1000},
	{id = 7391, chance = 1200},
	{id = 1987, chance = 100000, child = {
			{id = 2672, chance = 2000, maxCount = 3},
			{id = 7888, chance = 1000},
			{id = 8887, chance = 800}
		}
	}
}

mType:register(monster)
