local npcName = "Hook Spearman"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1204,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false
}

-- Npc shop
npcConfig.shop = {
	{ itemName = "bow", clientId = 3350, buy = 400 },
	{ itemName = "crossbow", clientId = 3349, buy = 500 },
	{ itemName = "royal spear", clientId = 7378, buy = 15 },
	{ itemName = "spear", clientId = 3277, buy = 10 },
	{ itemName = "arrow", clientId = 3447, buy = 3 },
	{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
	{ itemName = "bolt", clientId = 3446, buy = 4 },
	{ itemName = "earth arrow", clientId = 774, buy = 5 },
	{ itemName = "flaming arrow", clientId = 763, buy = 5 },
	{ itemName = "flash arrow", clientId = 761, buy = 5 },
	{ itemName = "power bolt", clientId = 3450, buy = 7 },
	{ itemName = "assassin star", clientId = 7368, buy = 100 },
	{ itemName = "quiver", clientId = 35562, buy = 100 },
	{ itemName = "jungle quiver", clientId = 35524, buy = 2000000 },
	{ itemName = "eldritch quiver", clientId = 35524, buy = 4000000 },
	{ itemName = "bow", clientId = 3350, sell = 130 },
	{ itemName = "jungle quiver", clientId = 35524, sell = 200000 },
	{ itemName = "eldritch quiver", clientId = 35524, sell = 400000 },
	{ itemName = "aiglos", clientId = 3313, sell = 100000 },
	{ itemName = "crossbow", clientId = 3349, sell = 160 },
	{ itemName = "spear", clientId = 3277, sell = 3 },
}

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Bought %ix %s for %i %s.", amount, name, totalCost, ItemType(npc:getCurrency()):getPluralName():lower()))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, subtype, amount, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:addModule(FocusModule:new())

npcType:register(npcConfig)