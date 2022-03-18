local npcName = "Rhagnar Ironside"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 610,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 2,
}

npcConfig.voices = {
	interval = 15000,
	chance = 20,
	{ text = "Welcome to Fidelitas Server!" }
}

npcConfig.flags = {
	floorchange = false
}

-- Npc shop
npcConfig.shop = {
	{ itemName = "sapphire hammer", clientId = 7437, sell = 6000},
	{ itemName = "drachaku", clientId = 10391, sell = 50000},
	{ itemName = "dragonbone staff", clientId = 7430, sell = 2200},
	{ itemName = "chaos mace", clientId = 7427, sell = 9000},
	{ itemName = "crystal mace", clientId = 3333, sell = 10000},
	{ itemName = "diamond sceptre", clientId = 7387, sell = 16000},
	{ itemName = "The Grond Hammer", clientId = 7415, sell = 100000},
	{ itemName = "hammer of wrath", clientId = 3332, sell = 30000},
	{ itemName = "heavy mace", clientId = 3340, sell = 35000},
	{ itemName = "mammoth whopper", clientId = 7381, sell = 800},
	{ itemName = "morning star", clientId = 3282, sell = 550},
	{ itemName = "silver mace", clientId = 3312, sell = 18000},
	{ itemName = "skull staff", clientId = 3324, sell = 6000},
	{ itemName = "thunder hammer", clientId = 3309, sell = 60000},
	{ itemName = "war hammer", clientId = 3279, sell = 18000},
	{ itemName = "clerical mace", clientId = 3311, buy = 2400},
	{ itemName = "morning star", clientId = 3282, buy = 1000},
	{ itemName = "skull staff", clientId = 3324, buy = 8000},
	{ itemName = "mammoth whopper", clientId = 7381, buy = 1600},
}

-- Create keywordHandler and npcHandler
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

-- onThink
npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

-- onAppear
npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

-- onDisappear
npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

-- onMove
npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

-- onSay
npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

-- onPlayerCloseChannel
npcType.onCloseChannel = function(npc, player)
	npcHandler:onCloseChannel(npc, player)
end

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

-- Function called by the callback "npcHandler:setCallback(CALLBACK_GREET, greetCallback)" in end of file
local function greetCallback(npc, player)
	npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|, how i can help you?")
	return true
end

-- On creature say callback
local function creatureSayCallback(npc, player, type, msg)
	local playerId = player:getId()
	if not npcHandler:checkInteraction(npc, player) then
		return false
	end
	return true
end

-- Set to local function "greetCallback"
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
-- Set to local function "creatureSayCallback"
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

-- Bye message
npcHandler:setMessage(MESSAGE_FAREWELL, "Yeah, good bye and don't come again!")
-- Walkaway message
npcHandler:setMessage(MESSAGE_WALKAWAY, "You not have education?")

npcHandler:addModule(FocusModule:new())

-- Register npc
npcType:register(npcConfig)
