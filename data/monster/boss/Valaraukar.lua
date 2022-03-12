local mType = Game.createMonsterType("Valaraukar")
local monster = {}

monster.name = "Valaraukar"
monster.description = "Valaraukar"
monster.experience = 45000
monster.outfit = {
	lookType = 300,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 40000
monster.maxHealth = 40000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 8955
monster.speed = 290
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10
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
	staticAttackChance = 85,
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
	{text = "Death!", yell = true},
	{text = "Come a little closer!", yell = true},
	{text = "The end is near!", yell = true}
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
	{name ="melee", interval = 2000, chance = 100, skill = 125, attack = 120},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -660, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -600, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -695, radius = 4, target = false, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -600, range = 10, radius = 7, target = false, effect = CONST_ME_MORTAREA}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 3000, chance = 25, type = COMBAT_HEALING, minDamage = 200, maxDamage = 295, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2148, chance = 40000, maxCount = 98},
	{id = 2148, chance = 40000, maxCount = 100},
	{id = 5909, chance = 50000, maxCount = 24},
	{id = 2152, chance = 20000, maxCount = 4},
	{id = 1987, chance = 100000, child = {
			{id = 7382, chance = 4000},
			{id = 8889, chance = 1100},
			{id = 5741, chance = 3200},
			{id = 8865, chance = 700},
			{id = 8752, chance = 400},
			{id = 7895, chance = 1077}
		}
	}
}

mType:register(monster)
