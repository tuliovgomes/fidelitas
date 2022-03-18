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
	{ itemName = "drachaku", clientId = 11302, sell = 50000},
	{ itemName = "dragonbone staff", clientId = 7430, sell = 2200},
	{ itemName = "clerical mace", clientId = 2423, sell = 1100},
	{ itemName = "studded club", clientId = 2448, sell = 10},
	{ itemName = "banana staff", clientId = 3966, sell = 700},
	{ itemName = "battle hammer", clientId = 2417, sell = 350},
	{ itemName = "bone club", clientId = 2449, sell = 25},
	{ itemName = "chaos mace", clientId = 7427, sell = 9000},
	{ itemName = "crystal mace", clientId = 2445, sell = 10000},
	{ itemName = "daramanian mace", clientId = 2439, sell = 150},
	{ itemName = "diamond sceptre", clientId = 7387, sell = 16000},
	{ itemName = "dragon hammer", clientId = 2434, sell = 2500},
	{ itemName = "grond", clientId = 7415, sell = 100000},
	{ itemName = "hammer of wrath", clientId = 2444, sell = 30000},
	{ itemName = "heavy mace", clientId = 2452, sell = 35000},
	{ itemName = "mace", clientId = 2398, sell = 45},
	{ itemName = "mammoth whopper", clientId = 7381, sell = 800},
	{ itemName = "morning star", clientId = 2394, sell = 550},
	{ itemName = "silver mace", clientId = 2424, sell = 18000},
	{ itemName = "skull staff", clientId = 2436, sell = 6000},
	{ itemName = "thunder hammer", clientId = 2421, sell = 60000},
	{ itemName = "war hammer", clientId = 2391, sell = 18000},
	{ itemName = "clerical mace", clientId = 2423, buy = 2400},
	{ itemName = "morning star", clientId = 2394, buy = 1000},
	{ itemName = "skull staff", clientId = 2436, buy = 8000},
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
