local npcName = "Carmadin Helter"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1460,
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
	{ itemName = "aghanim mask", clientId = 7901, sell = 20000},
	{ itemName = "amazon helmet", clientId = 2499, sell = 4000},
	{ itemName = "batwing hat", clientId = 10016, sell = 1800},
	{ itemName = "beholder helmet", clientId = 3972, sell = 8000},
	{ itemName = "brass helmet", clientId = 2460, sell = 25},
	{ itemName = "ceremonial mask", clientId = 2501, sell = 12000},
	{ itemName = "chain helmet", clientId = 2458, sell = 15},
	{ itemName = "charmer tiara", clientId = 3971, sell = 600},
	{ itemName = "crown helmet", clientId = 2491, sell = 6000},
	{ itemName = "crusader helmet", clientId = 2497, sell = 10000},
	{ itemName = "dark helmet", clientId = 2490, sell = 600},
	{ itemName = "demon helmet", clientId = 2493, sell = 75000},
	{ itemName = "devil helmet", clientId = 2462, sell = 3000},
	{ itemName = "dragon scale helmet", clientId = 2506, sell = 50000},
	{ itemName = "dwarven helmet", clientId = 2502, sell = 1000},
	{ itemName = "glacier mask", clientId = 7902, sell = 1200},
	{ itemName = "golden helmet", clientId = 2471, sell = 200000},
	{ itemName = "helmet of the ancients", clientId = 2342, sell = 15000},
	{ itemName = "horned helmet", clientId = 2496, sell = 30000},
	{ itemName = "horseman helmet", clientId = 3969, sell = 900},
	{ itemName = "iron helmet", clientId = 2459, sell = 600},
	{ itemName = "legion helmet", clientId = 2480, sell = 100},
	{ itemName = "magic steel helmet", clientId = 10316, sell = 45000},
	{ itemName = "magician hat", clientId = 2662, sell = 2500},
	{ itemName = "ragnir helmet", clientId = 7462, sell = 1100},
	{ itemName = "royal helmet", clientId = 2498, sell = 20000},
	{ itemName = "skull helmet", clientId = 5741, sell = 18000},
	{ itemName = "soldier helmet", clientId = 2481, sell = 225},
	{ itemName = "steel helmet", clientId = 2457, sell = 1100},
	{ itemName = "strange helmet", clientId = 2479, sell = 1200},
	{ itemName = "terra hood", clientId = 7903, sell = 900},
	{ itemName = "viking helmet", clientId = 2473, sell = 100},
	{ itemName = "warrior helmet", clientId = 2475, sell = 8000 },
	{ itemName = "winged helmet", clientId = 2474, sell = 25000 },
	{ itemName = "yalahari mask", clientId = 9778, sell = 520000 },
	{ itemName = "zenit helmet", clientId = 11296, sell = 90000 },
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
