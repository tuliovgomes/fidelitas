local npcName = "Max The barbarian"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1056,
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
	{ itemName = "axe of Frerin", clientId = 7434, buy = 130000 },
	{ itemName = "axe of main", clientId = 3962, buy = 26000 },
	{ itemName = "barbarian axe", clientId = 2429, buy = 700 },
	{ itemName = "battle axe", clientId = 2378, buy = 50 },
	{ itemName = "daramarian waraxe", clientId = 2440, buy = 6000 },
	{ itemName = "double axe", clientId = 2387, buy = 1300 },
	{ itemName = "dragon lance", clientId = 2414, buy = 22000 },
	{ itemName = "dramborleg", clientId = 7413, buy = 100000 },
	{ itemName = "blood cleaver", clientId = 7419, buy = 25000 },
	{ itemName = "durins axe", clientId = 8924, buy = 150000 },
	{ itemName = "dwarven axe", clientId = 2435, buy = 1400 },
	{ itemName = "fire axe", clientId = 2432, buy = 10000 },
	{ itemName = "frost razor", clientId = 7455, buy = 6000 },
	{ itemName = "great axe", clientId = 2415, buy = 50000 },
	{ itemName = "guardian halberd", clientId = 2427, buy = 20000 },
	{ itemName = "halberd", clientId = 2381, buy = 1100 },
	{ itemName = "hand axe", clientId = 2380, buy = 8 },
	{ itemName = "hatchet", clientId = 2388, buy = 25 },
	{ itemName = "headchopper", clientId = 7380, buy = 15000 },
	{ itemName = "knight axe", clientId = 2430, buy = 3000 },
	{ itemName = "naginata", clientId = 2426, buy = 12000 },
	{ itemName = "orcish axe", clientId = 2428, buy = 120 },
	{ itemName = "ravagers axe", clientId = 2443, buy = 30000 },
	{ itemName = "reapers axe", clientId = 7420, buy = 30000 },
	{ itemName = "ripper lance", clientId = 3964, buy = 1000 },
	{ itemName = "ruthless axe", clientId = 6553, buy = 35000 },
	{ itemName = "stonecutter axe", clientId = 2431, buy = 60000 },
	{ itemName = "twin axe", clientId = 2447, buy = 19000 },
	{ itemName = "vile axe", clientId = 7388, buy = 38000 },
	{ itemName = "war axe", clientId = 2454, buy = 25000 },
	{ itemName = "knight axe", clientId = 2430, sell = 8000 },
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
