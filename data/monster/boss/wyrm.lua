local mType = Game.createMonsterType("wyrm")
local monster = {}

monster.name = "Wyrm"
monster.description = "a wyrm"
monster.experience = 42000000
monster.outfit = {
	lookType = 291,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1200000
monster.maxHealth = 1200000
monster.runHealth = 1
monster.race = "blood"
monster.corpse = 8941
monster.speed = 900
monster.summonCost = 0

monster.changeTarget = {
	interval = 7000,
	chance = 75
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
	canPushCreatures = false,
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
	interval = 3000,
	chance = 15,
	{text = "I Am the King", yell = false},
	{text = "Eletrzz!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, skill = 150, attack = 170},
	{name ="combat", interval = 3000, chance = 81, type = COMBAT_ENERGYDAMAGE, minDamage = -2000, maxDamage = -4520, radius = 4, target = false, effect = CONST_ME_YELLOWENERGY},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_ENERGYDAMAGE, minDamage = -3101, maxDamage = -4123, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 2000, chance = 91, type = COMBAT_PHYSICALDAMAGE, minDamage = -2595, maxDamage = -5144, length = 5, spread = 2, effect = CONST_ME_POFF},
	{name ="combat", interval = 1000, chance = 70, type = COMBAT_ENERGYDAMAGE, minDamage = -2010, maxDamage = -3170, length = 4, spread = 4, effect = CONST_ME_PURPLEENERGY},
	{name ="combat", interval = 2000, chance = 84, type = COMBAT_LIFEDRAIN, minDamage = -3900, maxDamage = -5899, radius = 6, target = true, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_STUN}
}

monster.defenses = {
	defense = 60,
	armor = 50,
	{name ="combat", interval = 4000, chance = 105, type = COMBAT_HEALING, minDamage = 20005, maxDamage = 40005}
}

monster.loot = {
	{id = 2672, chance = 9000, maxCount = 3},
	{id = 2148, chance = 30000, maxCount = 100},
	{id = 7422, chance = 17212},
	{id = 12362, chance = 17224},
	{id = 8921, chance = 17260},
	{id = 7411, chance = 17444},
	{id = 2546, chance = 6000, maxCount = 10},
	{id = 1987, chance = 100000, child = {
			{id = 2148, chance = 100000, maxCount = 100},
			{id = 9932, chance = 43300}
		}
	}
}

mType:register(monster)
