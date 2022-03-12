local mType = Game.createMonsterType("Olog-hai")
local monster = {}

monster.name = "Olog-hai"
monster.description = "Olog-hai"
monster.experience = 35000
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 35000
monster.maxHealth = 35000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 5999
monster.speed = 200
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
	{text = "HUAHAHA", yell = true}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 45},
	{type = COMBAT_HOLYDAMAGE , percent = 60},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 140, attack = 100},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -550, maxDamage = -650, range = 7, radius = 5, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_GROUNDSHAKER}
}

monster.defenses = {
	defense = 45,
	armor = 40,
	{name ="speed", interval = 1000, chance = 7, speed = {min = 550, max = 550}, duration = 4000, effect = CONST_ME_MAGIC_RED}
}

monster.loot = {
	{id = 2152, chance = 100000, maxCount = 50},
	{id = 2671, chance = 10000, maxCount = 3},
	{id = 2023, chance = 11000},
	{id = 7368, chance = 1200, maxCount = 7},
	{id = 2174, chance = 800},
	{id = 2496, chance = 1000},
	{id = 2495, chance = 800},
	{id = 2528, chance = 4000},
	{id = 2231, chance = 7000},
	{id = 5930, chance = 4000, maxCount = 2},
	{id = 2393, chance = 9488},
	{id = 2454, chance = 6688},
	{id = 2150, chance = 4000, maxCount = 2},
	{id = 2365, chance = 100000, child = {
			{id = 2463, chance = 2000},
			{id = 2553, chance = 6000},
			{id = 2666, chance = 40000, maxCount = 6},
			{id = 2489, chance = 3000},
			{id = 2387, chance = 31000},
			{id = 2148, chance = 100000, maxCount = 40},
			{id = 2416, chance = 15000},
			{id = 2387, chance = 31000},
			{id = 2645, chance = 400},
			{id = 2188, chance = 1000},
			{id = 2645, chance = 3333},
			{id = 5930, chance = 1500},
			{id = 5893, chance = 50000, maxCount = 32}
		}
	}
}

mType:register(monster)
