local npcName = "Amenon at Ebano"

local npcType = Game.createNpcType(npcName)
local npcConfig = {}

npcConfig.name = npcName
npcConfig.description = npcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 128,
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
	{ itemName = "master archer's armor", clientId = 8888, sell = 30000},
	{ itemName = "windborn colossus armor", clientId = 8883, sell = 60000},
	{ itemName = "oceanborn leviathan armor", clientId = 8884, sell = 60000},
	{ itemName = "earthborn titan armor", clientId = 8882, sell = 60000},
	{ itemName = "zenit cuirass", clientId = 11295, sell = 90000},
	{ itemName = "pestilence omega", clientId = 8880, sell = 60000},
	{ itemName = "fireborn giant armor", clientId = 8881, sell = 60000},
	{ itemName = "aghanim robe", clientId = 7898, sell = 40000},
	{ itemName = "spirit cloak", clientId = 8870, sell = 2000},
	{ itemName = "focus cape", clientId = 8871, sell = 6000},
	{ itemName = "amazon armor", clientId = 2500, sell = 14000},
	{ itemName = "blue robe", clientId = 2656, sell = 7000},
	{ itemName = "brass armor", clientId = 2465, sell = 250},
	{ itemName = "demon armor ", clientId = 2494, sell = 30000},
	{ itemName = "crown armor", clientId = 2487, sell = 23000},
	{ itemName = "dark lords cape", clientId = 8865, sell = 24000},
	{ itemName = "divine plate", clientId = 8885, sell = 160000},
	{ itemName = "dwarven armor", clientId = 2503, sell = 8000},
	{ itemName = "elven armor", clientId = 2505, sell = 7000},
	{ itemName = "frozen plate", clientId = 8887, sell = 15000},
	{ itemName = "glacier robe", clientId = 7898, sell = 6500},
	{ itemName = "knight armor", clientId = 2476, sell = 18000},
	{ itemName = "magma coat ", clientId = 7899, sell = 18000},
	{ itemName = "mammoth fur cape", clientId = 7463, sell = 1400},
	{ itemName = "dark armor", clientId = 2489, sell = 1000},
	{ itemName = "native armor", clientId = 2508, sell = 900},
	{ itemName = "noble armor", clientId = 2486, sell = 9000},
	{ itemName = "plate armor", clientId = 2463, sell = 1650},
	{ itemName = "red robe", clientId = 2655, sell = 25000},
	{ itemName = "robe of the underworld", clientId = 8890, sell = 7000},
	{ itemName = "scale armor", clientId = 2483, sell = 500},
	{ itemName = "spellweavers robe", clientId = 11349, sell = 7000},
	{ itemName = "terra mantle", clientId = 7884, sell = 20000 },
	{ itemName = "skullmaster armor", clientId = 8889, sell = 280000 },
	{ itemName = "golden armor", clientId = 2466, sell = 60000 },
	{ itemName = "crystalline armor", clientId = 8878, sell = 41000 },
	{ itemName = "divine cuirass", clientId = 9776, sell = 400000 },
	{ itemName = "dragon scale mail", clientId = 2492, sell = 40000 },
	{ itemName = "magic plate armor", clientId = 2472, sell = 200000 },
	{ itemName = "legolas plate", clientId = 8891, sell = 330000 },
	{ itemName = "valvet mantle", clientId = 8868, sell = 7000 },
	{ itemName = "voltage armor", clientId = 8879, sell = 45000 },
	{ itemName = "aegis armor", clientId = 3968, sell = 30000 },
	{ itemName = "divine robe", clientId = 8867, sell = 30000 },
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
