local npcName = "Homan The Nadir"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1386,
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
	{ itemName = "Crystal Sword", clientId = 7449, sell = 2000},
	{ itemName = "Anduril ", clientId = 2390, sell = 200000},
	{ itemName = "Bone Sword ", clientId = 2450, sell = 60},
	{ itemName = "Bright Sword ", clientId = 2407, sell = 6000},
	{ itemName = "Broad Sword", clientId = 2413, sell = 300},
	{ itemName = "Demonrage Sword", clientId = 7382, sell = 50000},
	{ itemName = "djinn blade ", clientId = 2451, sell = 7000},
	{ itemName = "emerald sword", clientId = 8930, sell = 15000},
	{ itemName = "fire sword", clientId = 2392, sell = 5000},
	{ itemName = "giant sword", clientId = 2393, sell = 25000},
	{ itemName = "haunted blade", clientId = 7407, sell = 18000},
	{ itemName = "heavy machete", clientId = 2441, sell = 950},
	{ itemName = "katana", clientId = 2412, sell = 120},
	{ itemName = "longsword ", clientId = 2397, sell = 225},
	{ itemName = "magic sword", clientId = 2400, sell = 75000},
	{ itemName = "narsil ", clientId = 6528, sell = 400000},
	{ itemName = "pharaoh sword", clientId = 2446, sell = 1300},
	{ itemName = "scimitar", clientId = 2419, sell = 265},
	{ itemName = "serpent sword", clientId = 2409, sell = 1500},
	{ itemName = "spike sword", clientId = 2383, sell = 700},
	{ itemName = "sting", clientId = 7404, sell = 2800},
	{ itemName = "templar scytheblade", clientId = 3963, sell = 450},
	{ itemName = "two handed sword ", clientId = 2377, sell = 1200},
	{ itemName = "warlord sword ", clientId = 2408, sell = 100000},
	{ itemName = "wyvern fang", clientId = 7408, sell = 2300},
	{ itemName = "Bright Sword", clientId = 2407, buy = 10000},
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
