local mType = Game.createMonsterType("behemoth")
local monster = {}

monster.name = "behemoth"
monster.description = "um behemoth"
monster.experience = 2500
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4000
monster.maxHealth = 4000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 5999
monster.speed = 280
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.flags = {
	attackable = true,
	hostile = true,
	summonable = false,
	convinceable = false,
	illusionable = false,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
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
	interval = 5000,
	chance = 10,
	{text = "You're so little!", yell = false},
	{text = "Human flesh - delicious!", yell = false},
	{text = "Crush the intruders!", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 55},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 85, attack = 85},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -285, range = 7, shootEffect = CONST_ANI_LARGEROCK}
}

monster.defenses = {
	defense = 5,
	armor = 5,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 320, max = 320}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{id = 1987, chance = 100000},
	{id = 2148, chance = 100000, maxCount = 100},
	{id = 2416, chance = 5444},
	{id = 2023, chance = 5444},
	{id = 2231, chance = 5444},
	{id = 1999, chance = 100000, child = {
			{id = 2666, chance = 100000, maxCount = 5},
			{id = 2150, chance = 5000, maxCount = 3},
			{id = 2489, chance = 3300},
			{id = 2393, chance = 1000},
			{id = 2645, chance = 900}
		}
	}
}

mType:register(monster)
