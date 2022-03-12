local mType = Game.createMonsterType("azazel")
local monster = {}

monster.name = "Azazel"
monster.description = "Azazel"
monster.experience = 150000
monster.outfit = {
	lookType = 334,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 324150
monster.maxHealth = 324150
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 11310
monster.speed = 320
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
	pushable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	interval = 7000,
	chance = 10,
	{text = "Muahahahaha", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 55},
	{type = COMBAT_ENERGYDAMAGE, percent = 60},
	{type = COMBAT_EARTHDAMAGE, percent = 80},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 55},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 90}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -505, maxDamage = -650},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -620, maxDamage = -1780, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA},
	{name ="combat", interval = 1000, chance = 28, type = COMBAT_PHYSICALDAMAGE, minDamage = -590, maxDamage = -1699, range = 7, radius = 7, target = false, effect = CONST_ME_BLOCKHIT},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -1050, maxDamage = -2350, length = 8, spread = 3, effect = CONST_ME_FIREATTACK},
	{name ="combat", interval = 1500, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -700, maxDamage = -1899, radius = 1, target = true, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_STUN},
	{name ="outfit", interval = 3000, chance = 15, monster = "deer", duration = 12000, range = 7, effect = CONST_ME_SMOKE}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 4000, chance = 20, type = COMBAT_HEALING, minDamage = 0, maxDamage = 500, effect = CONST_ME_YELLOW_RINGS}
}

monster.loot = {
	{id = 2672, chance = 25000, maxCount = 100, description = "dragom ham"},
	{id = 2672, chance = 25000, maxCount = 100, description = "dragom ham"},
	{id = 1987, chance = 100000, description = "bag", child = {
			{id = 11299, chance = 1502, description = "drakinata"},
			{id = 11301, chance = 800, description = "chaos blade"},
			{id = 11295, chance = 1303, description = "zenit cuirass"},
			{id = 11298, chance = 1401, description = "zenit legs"},
			{id = 11296, chance = 802, description = "zenit helmet"},
			{id = 11297, chance = 1503, description = "zenit shoes"},
			{id = 11302, chance = 1804, description = "drachaku"},
			{id = 8856, chance = 804, description = "bow"}
		}
	}
}

mType:register(monster)
