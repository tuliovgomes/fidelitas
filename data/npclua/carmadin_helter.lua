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
	{ itemName = "aghanim mask", clientId = 828, sell = 20000},
	{ itemName = "amazon helmet", clientId = 3393, sell = 4000},
	{ itemName = "batwing hat", clientId = 9103, sell = 1800},
	{ itemName = "bonelord helmet", clientId = 3408, sell = 6000},
	{ itemName = "ceremonial mask", clientId = 3395, sell = 12000},
	{ itemName = "crown helmet", clientId = 3385, sell = 6000},
	{ itemName = "crusader helmet", clientId = 3391, sell = 10000},
	{ itemName = "demon helmet", clientId = 3387, sell = 75000},
	{ itemName = "dragon scale helmet", clientId = 3400, sell = 50000},
	{ itemName = "dwarven helmet", clientId = 3396, sell = 1000},
	{ itemName = "glacier mask", clientId = 829, sell = 1200},
	{ itemName = "golden helmet", clientId = 3365, sell = 200000},
	{ itemName = "helmet of the ancients", clientId = 3229, sell = 15000},
	{ itemName = "horned helmet", clientId = 3390, sell = 30000},
	{ itemName = "horseman helmet", clientId = 3405, sell = 900},
	{ itemName = "magic steel helmet", clientId = 9399, sell = 45000},
	{ itemName = "magician hat", clientId = 3573, sell = 2500},
	{ itemName = "royal helmet", clientId = 3392, sell = 20000},
	{ itemName = "skull helmet", clientId = 5741, sell = 18000},
	{ itemName = "strange helmet", clientId = 3373, sell = 1200},
	{ itemName = "terra hood", clientId = 830, sell = 900},
	{ itemName = "warrior helmet", clientId = 3369, sell = 8000 },
	{ itemName = "winged helmet", clientId = 3368, sell = 125000 },
	{ itemName = "Valar mask", clientId = 8864, sell = 520000 },
	{ itemName = "zenit helmet", clientId = 10385, sell = 90000 },
	{ itemName = "aghanim mask", clientId = 828, buy = 90000},
	{ itemName = "amazon helmet", clientId = 3393, buy = 8000},
	{ itemName = "batwing hat", clientId = 9103, buy = 4800},
	{ itemName = "bonelord helmet", clientId = 3408, buy = 9000},
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
