local mType = Game.createMonsterType("Gandalf")
local monster = {}

monster.name = "Gandalf"
monster.description = "Gandalf"
monster.experience = 1350000
monster.outfit = {
	lookType = 229,
	lookHead = 20,
	lookBody = 30,
	lookLegs = 40,
	lookFeet = 50,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 1350000
monster.maxHealth = 1350000
monster.runHealth = 2500
monster.race = "venom"
monster.corpse = 6078
monster.speed = 1200
monster.summonCost = 0

monster.changeTarget = {
	interval = 2000,
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
	chance = 20,
	{text = "Sou o Mago Dos MAGOS!", yell = true},
	{text = "Que venham meus aprendizes ferumbras e saruman me ajudem!", yell = true},
	{text = "você já está morto?!", yell = true}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 70},
	{type = COMBAT_ENERGYDAMAGE, percent = 80},
	{type = COMBAT_EARTHDAMAGE, percent = 55},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 80},
	{type = COMBAT_HOLYDAMAGE , percent = 80},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 135, attack = 135},
	{name ="combat", interval = 1000, chance = 22, type = COMBAT_HOLYDAMAGE, minDamage = -2900, maxDamage = -4600, range = 5, radius = 9, target = true, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -1800, maxDamage = -3600, radius = 9, target = false, effect = CONST_ME_GREEN_RINGS},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -1800, maxDamage = -5800, radius = 9, target = false, effect = CONST_ME_YELLOWENERGY},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_HOLYDAMAGE, minDamage = -2500, maxDamage = -4800, length = 6, spread = 0, effect = CONST_ME_HOLYAREA},
	{name ="combat", interval = 1500, chance = 30, type = COMBAT_MANADRAIN, minDamage = -2000, maxDamage = -6100, radius = 9, target = false, effect = CONST_ME_YELLOWENERGY}
}

monster.defenses = {
	defense = 30,
	armor = 30,
	{name ="combat", interval = 1000, chance = 13, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1400, effect = CONST_ME_MAGIC_GREEN},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 600, maxDamage = 3900, effect = CONST_ME_MAGIC_GREEN},
	{name ="speed", interval = 1000, chance = 4, speed = {min = 360, max = 360}, duration = 7000, effect = CONST_ME_MAGIC_BLUE},
	{name ="invisible", interval = 1000, chance = 3, duration = 4000, effect = CONST_ME_MAGIC_BLUE}
}

monster.maxSummons = 2
monster.summons = {
	{name = "ferumbras", chance = 15, interval = 2500, max = 1},
	{name = "saruman", chance = 13, interval = 3800, max = 1}
}

monster.loot = {
	{id = 2160, chance = 100000, maxCount = 4},
	{id = 2160, chance = 100000, maxCount = 6},
	{id = 2160, chance = 100000, maxCount = 7},
	{id = 2160, chance = 100000, maxCount = 8},
	{id = 2160, chance = 100000, maxCount = 5},
	{id = 2160, chance = 100000, maxCount = 9},
	{id = 11390, chance = 8000},
	{id = 7708, chance = 6000},
	{id = 11113, chance = 4000}
}

mType:register(monster)
