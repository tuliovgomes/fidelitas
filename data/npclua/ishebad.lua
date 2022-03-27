local internalNpcName = "Jacques DeMolay"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 8

npcConfig.outfit = {
	lookType = 1173
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Promotion 1
local promo1 = keywordHandler:addKeyword({'promo1'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to be promoted in your vocation for 20000 gold?'})
	promo1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, promo = 1, level = 35, cost = 20000})
	promo1:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'Ok, whatever.', reset = true})

-- Promotion 2
	local promo2 = keywordHandler:addKeyword({'promo2'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to be promoted in your vocation for 200000 gold?'})
	promo2:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, promo = 2, level = 101, cost = 20000})
	promo2:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'Ok, whatever.', reset = true})

-- Promotion 3
	local promo3 = keywordHandler:addKeyword({'promo3'}, StdModule.say, {npcHandler = npcHandler, text = 'Do you want to be promoted in your vocation for 2000000 gold?'})
	promo3:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler,  promo = 3, level = 400, cost = 20000})
	promo3:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'Ok, whatever.', reset = true})

npcHandler:setMessage(MESSAGE_GREET, 'I\'m a last Grand Master of the Order of Templar Knights and i can promote your vocation if you have merit, level and money! Level 35 {promo1}  Level 101 {promo2} Level 400 {promo3}')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye, |PLAYERNAME|!')

npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
