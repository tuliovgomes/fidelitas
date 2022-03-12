local mType = Game.createMonsterType("Jormungand")
local monster = {}

monster.name = "Jormungand"
monster.description = "a Jormungand"
monster.experience = 45000
monster.outfit = {
	lookType = 121,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 60000
monster.maxHealth = 60000
monster.runHealth = 300
monster.race = "blood"
monster.corpse = 6048
monster.speed = 240
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
	canPushCreatures = true,
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
	interval = 5000,
	chance = 10,
	{text = "FCHHHHH", yell = false},
	{text = "HISSSS", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 171, attack = 164},
	{name ="speed", interval = 2000, chance = 17, speed = {min = -680, max = -680}, duration = 15000, range = 7, radius = 4, target = true, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_ICEDAMAGE, minDamage = -1150, maxDamage = -1600, length = 8, spread = 4, effect = CONST_ME_LOSEENERGY},
	{name ="combat", interval = 1000, chance = 12, type = COMBAT_EARTHDAMAGE, minDamage = -190, maxDamage = -600, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS},
	{name ="combat", interval = 1000, chance = 14, type = COMBAT_ICEDAMAGE, minDamage = -85, maxDamage = -600, range = 7, shootEffect = CONST_ANI_SMALLICE}
}

monster.defenses = {
	defense = 35,
	armor = 25,
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 300, maxDamage = 480, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 2160, chance = 100},
	{id = 2148, chance = 100000, maxCount = 25},
	{id = 2498, chance = 1700},
	{id = 2195, chance = 1800},
	{id = 2475, chance = 1800},
	{id = 3976, chance = 50000, maxCount = 10},
	{id = 1987, chance = 100000, child = {
			{id = 2214, chance = 1200},
			{id = 2671, chance = 65000, maxCount = 3},
			{id = 2666, chance = 90000, maxCount = 4},
			{id = 2146, chance = 5000, maxCount = 2},
			{id = 2177, chance = 1800},
			{id = 8882, chance = 1500},
			{id = 4850, chance = 1200},
			{id = 2149, chance = 4000, maxCount = 3},
			{id = 2536, chance = 555},
			{id = 2168, chance = 2500},
			{id = 2197, chance = 10000}
		}
	}
}

mType:register(monster)
