local mType = Game.createMonsterType("Allukard")
local monster = {}

monster.name = "Allukard"
monster.description = "a Allukard"
monster.experience = 10500
monster.outfit = {
	lookType = 312,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 25205
monster.maxHealth = 25205
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9660
monster.speed = 250
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
	chance = 100,
	{text = "Kneel before your Mistress!", yell = false},
	{text = "Dead is the new alive", yell = false},
	{text = "Come, let me kiss you, darling. Oh wait, I meant kill.", yell = false},
	{text = "Enjoy the pain - I know you love it.", yell = false}
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
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 55},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -600, maxDamage = -700},
	{name ="combat", interval = 2500, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -500, maxDamage = -600, range = 10, radius = 2, target = true, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA},
	{name ="combat", interval = 2000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -450, range = 7, radius = 2, target = true, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_GROUNDSHAKER},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -600, radius = 2, target = false, effect = CONST_ME_POFF},
	{name ="combat", interval = 2000, chance = 34, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -1199, length = 7, spread = 0, effect = CONST_ME_DRAWBLOOD},
	{name ="speed", interval = 1500, chance = 35, speed = {min = -700, max = -700}, duration = 20000, range = 7, radius = 3, target = false, effect = CONST_ME_GREEN_RINGS}
}

monster.defenses = {
	defense = 15,
	armor = 30
}

monster.loot = {
	{id = 2148, chance = 1, maxCount = 84, description = "gps"},
	{id = 7588, chance = 1, description = "strong health potion"},
	{id = 7589, chance = 1, description = "strong mana potion"},
	{id = 2145, chance = 4000, description = "small diamond"},
	{id = 2127, chance = 4000, description = "esmerald blange"},
	{id = 1987, chance = 100000, child = {
			{id = 2186, chance = 1, description = "moonlight rod"},
			{id = 2489, chance = 5000, description = "da"},
			{id = 2534, chance = 1201, description = "vs"},
			{id = 2446, chance = 1200, description = "ps"},
			{id = 9777, chance = 900, description = "valar kilt"}
		}
	}
}

mType:register(monster)
