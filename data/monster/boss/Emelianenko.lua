local mType = Game.createMonsterType("Emelianenko")
local monster = {}

monster.name = "Emelianenko"
monster.description = "Emelianenko"
monster.experience = 300000
monster.outfit = {
	lookType = 323,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 205000
monster.maxHealth = 205000
monster.runHealth = 0
monster.race = "blood"
monster.corpse = 9107
monster.speed = 850
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
	interval = 2500,
	chance = 10,
	{text = "Take that creature off my back!! I can fell it!", yell = false},
	{text = "HEEEEEEEELP!", yell = false},
	{text = "You will be the next infected one... GRAAAAAAAAARRR!", yell = false},
	{text = "Science... is a curse.", yell = false},
	{text = "Run as fast as you can.", yell = false},
	{text = "Oh by the gods! What is this... aaaaaargh!", yell = false}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 60},
	{type = COMBAT_ENERGYDAMAGE, percent = 90},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 80},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.attacks = {
	{name ="melee", interval = 1500, chance = 100, minDamage = -1800, maxDamage = -2500},
	{name ="combat", interval = 3000, chance = 90, type = COMBAT_LIFEDRAIN, minDamage = -1300, maxDamage = -4400, range = 1, effect = CONST_ME_STUN}
}

monster.defenses = {
	defense = 15,
	armor = 30,
	{name ="combat", interval = 8000, chance = 50, type = COMBAT_HEALING, minDamage = 1700, maxDamage = 2000, effect = CONST_ME_SLEEP}
}

monster.loot = {
	{id = 2470, chance = 804, description = "golden legs"},
	{id = 2471, chance = 703, description = "golden helmet"},
	{id = 2646, chance = 902, description = "golden boots"},
	{id = 2522, chance = 1001, description = "great shield"},
	{id = 2466, chance = 1001, description = "golden armor"},
	{id = 7382, chance = 1800, description = "demonrage sword"},
	{id = 2090, chance = 10000, description = "crytal key"},
	{id = 2396, chance = 1900, description = "ice rapier"}
}

mType:register(monster)
