local npcName = "Hecate Aguamenti"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1415,
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
	{ itemName = "aghanin scepter", clientId = 7424, sell = 120000},
	{ itemName = "arcane wand", clientId = 2453, sell = 4500},
	{ itemName = "hailstorm rod", clientId = 2183, sell = 3000},
	{ itemName = "mekansm", clientId = 7410, sell = 150000},
	{ itemName = "moonlight rod", clientId = 2186, sell = 266},
	{ itemName = "motaba wand", clientId = 7379, sell = 7000},
	{ itemName = "necrotic rod", clientId = 2185, sell = 533},
	{ itemName = "saruman scepter", clientId = 7451, sell = 16000},
	{ itemName = "saurons breath", clientId = 8910, sell = 500},
	{ itemName = "snakebite rod", clientId = 2182, sell = 16},
	{ itemName = "terra rod", clientId = 2181, sell = 1000},
	{ itemName = "wand of cosmic energy", clientId = 2189, sell = 1000},
	{ itemName = "wand of decay", clientId = 2188, sell = 533},
	{ itemName = "wand of dragonbreath", clientId = 2191, sell = 266},
	{ itemName = "wand of inferno", clientId = 2187, sell = 2000},
	{ itemName = "wand of vortex", clientId = 2193, sell = 16},
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