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
	{ itemName = "ancient shield", clientId = 2532, buy = 4000},
	{ itemName = "battle shield", clientId = 2513, buy = 600},
	{ itemName = "blessed shield", clientId = 2523, buy = 500000},
	{ itemName = "necromancer shield", clientId= 6433, buy = 900000},
	{ itemName = "beholder shield", clientId= 2518, buy = 14000},
	{ itemName = "bone shield", clientId = 2541, buy = 225},
	{ itemName = "brass shield", clientId= 2511, buy = 23},
	{ itemName = "cerberus shield", clientId = 8906, buy = 1000000},
	{ itemName = "copper shield", clientId = 2530, buy = 150},
	{ itemName = "crown shield", clientId = 2519, buy = 22000},
	{ itemName = "dark shield", clientId = 2521, buy = 800},
	{ itemName = "demon shield", clientId = 2520, buy = 50000},
	{ itemName = "dragon shield", clientId = 2516, buy = 14000},
	{ itemName = "dwarven shield", clientId = 2525, buy = 1500},
	{ itemName = "great shield", clientId = 2522, buy = 250000},
	{ itemName = "griffin shield", clientId = 2533, buy = 10000},
	{ itemName = "guardian shield", clientId = 2515, buy = 12000},
	{ itemName = "mastermind shield", clientId = 2514, buy = 70000},
	{ itemName = "medusa shield", clientId = 2536, buy = 30000},
	{ itemName = "phoenix shield", clientId = 2539, buy = 40000},
	{ itemName = "plate shield", clientId = 2510, buy = 45},
	{ itemName = "rose shield", clientId = 2527, buy = 5000},
	{ itemName = "scarab shield", clientId = 2540, buy = 700},
	{ itemName = "shield of honour", clientId = 2517, buy = 31000},
	{ itemName = "steel shield", clientId = 2509, buy = 300},
	{ itemName = "studded shield", clientId = 2526, buy = 10},
	{ itemName = "tempest shield", clientId = 2542, buy = 130000},
	{ itemName = "tortoise shield", clientId = 6131, buy = 900},
	{ itemName = "tower shield", clientId = 2528, buy = 18000},
	{ itemName = "tusk shield", clientId = 3973, buy = 3000},
	{ itemName = "vampire shield", clientId = 2534, buy = 35000},
	{ itemName = "castle shield", clientId = 2535, buy = 7000},
	{ itemName = "battle shield", clientId = 2513, sell = 1200 },
	{ itemName = "black shield", clientId = 2529, sell = 170 },
	{ itemName = "bone shield", clientId = 2541, sell = 450 },
	{ itemName = "brass shield", clientId = 2511, sell = 46 },
	{ itemName = "castle shield", clientId = 2535, sell = 14000 },
	{ itemName = "copper shield", clientId = 2530, sell = 300 },
	{ itemName = "dark shield", clientId = 2521, sell = 1600 },
	{ itemName = "dwarven shield", clientId = 2525, sell = 3000 },
	{ itemName = "griffin shield", clientId = 2533, sell = 20000 },
	{ itemName = "plate shield", clientId = 2510, sell = 90 },
	{ itemName = "rose shield", clientId = 2527, sell = 10000 },
	{ itemName = "salamander shield", clientId = 3975, sell = 2800 },
	{ itemName = "scarab shield", clientId = 2540, sell = 1400 },
	{ itemName = "steel shield", clientId = 2509, sell = 600 },
	{ itemName = "studded shield", clientId = 2526, sell = 20 },
	{ itemName = "tortoise shield", clientId = 6131, sell = 1800 },
	{ itemName = "tusk shield", clientId = 3973, sell = 6000 },
	{ itemName = "wooden shield", clientId = 2512, sell = 10 },
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
