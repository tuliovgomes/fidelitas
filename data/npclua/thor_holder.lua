local npcName = "Thor Holder"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1288,
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
	{ itemName = "ancient shield", clientId = 3432, sell = 4000},
	{ itemName = "blessed shield", clientId = 3423, sell = 500000},
	{ itemName = "necromancer shield", clientId= 6432, sell = 900000},
	{ itemName = "beholder shield", clientId= 3418, sell = 14000},
	{ itemName = "cerberus shield", clientId = 8078, sell = 1000000},
	{ itemName = "crown shield", clientId = 3419, sell = 22000},
	{ itemName = "demon shield", clientId = 3420, sell = 50000},
	{ itemName = "dragon shield", clientId = 3416, sell = 14000},
	{ itemName = "dwarven shield", clientId = 3425, sell = 1500},
	{ itemName = "great shield", clientId = 3422, sell = 250000},
	{ itemName = "griffin shield", clientId = 3433, sell = 10000},
	{ itemName = "guardian shield", clientId = 3415, sell = 12000},
	{ itemName = "mastermind shield", clientId = 3414, sell = 70000},
	{ itemName = "medusa shield", clientId = 3436, sell = 30000},
	{ itemName = "Amazon shield", clientId = 3437, sell = 30000},
	{ itemName = "phoenix shield", clientId = 3439, sell = 40000},
	{ itemName = "rose shield", clientId = 3427, sell = 5000},
	{ itemName = "shield of honour", clientId = 3417, sell = 31000},
	{ itemName = "tempest shield", clientId = 3442, sell = 130000},
	{ itemName = "tower shield", clientId = 3428, sell = 18000},
	{ itemName = "vampire shield", clientId = 3434, sell = 35000},
	{ itemName = "castle shield", clientId = 3435, sell = 7000},
	{ itemName = "dwarven shield", clientId = 3425, buy = 3000 },
	{ itemName = "griffin shield", clientId = 3433, buy = 20000 },
	{ itemName = "rose shield", clientId = 3427, buy = 10000 },
	{ itemName = "tortoise shield", clientId = 6131, buy = 1800 },
	{ itemName = "tusk shield", clientId = 3443, buy = 6000 },
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
