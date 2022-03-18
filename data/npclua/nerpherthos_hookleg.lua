local npcName = "Nerpherthos Hookleg"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1243,
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
	{ itemName = "leather legs", clientId = 2649, sell = 8},
	{ itemName = "aghanim legs", clientId = 7895, sell = 18000},
	{ itemName = "blue legs", clientId = 7730, sell = 150000},
	{ itemName = "brass legs", clientId = 2478, sell = 140},
	{ itemName = "chain legs", clientId = 2648, sell = 125},
	{ itemName = "crown legs", clientId = 2488, sell = 18000},
	{ itemName = "demon legs", clientId = 2495, sell = 60000},
	{ itemName = "dragon scale legs", clientId = 2469, sell = 50000},
	{ itemName = "dwarven legs", clientId = 2504, sell = 7000},
	{ itemName = "elven legs", clientId = 2507, sell = 4000},
	{ itemName = "glacier kilt", clientId = 7896, sell = 7000},
	{ itemName = "golden legs", clientId = 2470, sell = 300000},
	{ itemName = "knight legs", clientId = 2477, sell = 12000},
	{ itemName = "magma legs", clientId = 7894, sell = 22000},
	{ itemName = "mammoth fur shorts", clientId = 7464, sell = 450},
	{ itemName = "plate legs", clientId = 2647, sell = 2000},
	{ itemName = "studded legs", clientId = 2468, sell = 35},
	{ itemName = "terra legs", clientId = 7885, sell = 13000},
	{ itemName = "valar kilt", clientId = 9777, sell = 500000},
	{ itemName = "zenit legs", clientId = 11298, sell = 45000},
	{ itemName = "aghanim legs", clientId = 7895, buy = 36000},
	{ itemName = "brass legs", clientId = 2478, buy = 600},
	{ itemName = "chain legs", clientId = 2648, buy = 300},
	{ itemName = "dwarven legs", clientId = 2504, buy = 10000},
	{ itemName = "elven legs", clientId = 2507, buy = 8000},
	{ itemName = "glacier kilt", clientId = 7896, buy = 14000},
	{ itemName = "knight legs", clientId = 2477, buy = 24000},
	{ itemName = "leather legs", clientId = 2649, buy = 16},
	{ itemName = "mammoth fur shorts", clientId = 7464, buy = 600},
	{ itemName = "plate legs", clientId = 2647, buy = 4000},
	{ itemName = "studded legs", clientId = 2468, buy = 70},
	{ itemName = "terra legs", clientId = 7885, buy = 28000},
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
