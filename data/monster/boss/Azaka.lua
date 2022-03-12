local mType = Game.createMonsterType("Azaka")
local monster = {}

monster.name = "Azaka"
monster.description = "Azaka"
monster.experience = 20000
monster.outfit = {
	lookType = 214,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 20000
monster.maxHealth = 20000
monster.runHealth = 15
monster.race = "blood"
monster.corpse = 6055
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
	illusionable = true,
	boss = false,
	ignoreSpawnBlock = false,
	pushable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 3,
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
	{text = "grak brrretz!", yell = false},
	{text = "grow truk grrrrr.", yell = false},
	{text = "VAI MORRER NB, dekklep zurk.", yell = false}
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
	{type = COMBAT_ICEDAMAGE, percent = 45},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 92, attack = 140},
	{name ="combat", interval = 1000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -101, maxDamage = -300, range = 1},
	{name ="speed", interval = 1000, chance = 18, speed = {min = -800, max = -800}, duration = 5000, range = 7, effect = CONST_ME_MAGIC_RED},
	{name ="drunk", interval = 1000, chance = 10, drunkenness = 25, duration = 10000, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA},
	{name ="outfit", interval = 1000, chance = 9, monster = "chicken", duration = 5000, range = 7, effect = CONST_ME_MAGIC_BLUE},
	{name ="combat", interval = 800, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -266, maxDamage = -300, radius = 6, target = false, effect = CONST_ME_POISONAREA},
	{name ="poisonfield", interval = 1000, chance = 13, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_POISON}
}

monster.defenses = {
	defense = 8,
	armor = 3,
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 3, maxDamage = 9, effect = CONST_ME_MAGIC_BLUE},
	{name ="speed", interval = 1000, chance = 8, speed = {min = 200, max = 200}, duration = 4000, effect = CONST_ME_MAGIC_RED},
	{name ="invisible", interval = 1000, chance = 5, duration = 3000, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 7885, chance = 900},
	{id = 2152, chance = 1000, maxCount = 12},
	{id = 2666, chance = 4000, maxCount = 2},
	{id = 2230, chance = 100},
	{id = 2127, chance = 400},
	{id = 1987, chance = 1000, child = {
			{id = 3967, chance = 500},
			{id = 2181, chance = 400},
			{id = 2195, chance = 200},
			{id = 2323, chance = 500}
		}
	}
}

mType:register(monster)
