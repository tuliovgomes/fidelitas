local mType = Game.createMonsterType("Odsea")
local monster = {}

monster.name = "Odsea"
monster.description = "a Odsea"
monster.experience = 24000000
monster.outfit = {
	lookType = 354,
	lookHead = 13,
	lookBody = 94,
	lookLegs = 84,
	lookFeet = 98,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3500000
monster.maxHealth = 3500000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 6068
monster.speed = 1200
monster.summonCost = 0

monster.changeTarget = {
	interval = 5000,
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
	canPushItems = false,
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
	interval = 4000,
	chance = 100,
	{text = "IS THE END!", yell = false}
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
	{type = COMBAT_ENERGYDAMAGE, percent = 40},
	{type = COMBAT_EARTHDAMAGE, percent = 40},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 40},
	{type = COMBAT_HOLYDAMAGE , percent = 25},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -3200, maxDamage = -7200},
	{name ="combat", interval = 2000, chance = 83, type = COMBAT_LIFEDRAIN, minDamage = -6000, maxDamage = -10603, range = 1, effect = CONST_ME_MAGIC_RED},
	{name ="combat", interval = 2000, chance = 80, type = COMBAT_PHYSICALDAMAGE, minDamage = -5101, maxDamage = -12444, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 1000, chance = 91, type = COMBAT_PHYSICALDAMAGE, minDamage = -6120, maxDamage = -12300, range = 7, shootEffect = CONST_ANI_ENERGY},
	{name ="combat", interval = 1000, chance = 85, type = COMBAT_FIREDAMAGE, minDamage = -6000, maxDamage = -9300, range = 7, radius = 7, target = true, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA}
}

monster.defenses = {
	defense = 70,
	armor = 70,
	{name ="combat", interval = 2000, chance = 105, type = COMBAT_HEALING, minDamage = 20005, maxDamage = 40005, effect = CONST_ME_MAGIC_BLUE}
}

monster.loot = {
	{id = 12605, chance = 1000, description = "strong mana potion"},
	{id = 7697, chance = 15400, description = "blood staff"},
	{id = 9653, chance = 15500, description = "blood sword"},
	{id = 10521, chance = 100000, description = "bag", child = {
			{id = 11113, chance = 2000, description = "moonlight rod"},
			{id = 2640, chance = 16200, description = "soft boots"},
			{id = 2522, chance = 15300, description = "great shield"}
		}
	}
}

mType:register(monster)
