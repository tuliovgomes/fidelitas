local login = CreatureEvent("PlayerLogin")

local vocations = { --Items given depending on vocation [1] is vocation 1: sorcerer
	[1] = {3074},
	[2] = {3066},
	[3] = {3277},
	[4] = {3271},
	[5] = {3311}
}

local items_all = { --Items given to all players no matter vocation
	2854, 3351, 3357, 3557, 3413, 3552
}


function login.onLogin(player)
	local loginStr = "Welcome to " .. configManager.getString(configKeys.SERVER_NAME) .. "!"
	if player:getLastLoginSaved() <= 0 then
		VOC = vocations[player:getVocation():getId()]

        for i = 1, #items_all do
            player:addItem(items_all[i], 1)
        end

        if not VOC then return true end

        for i = 1, #VOC do
            player:addItem(VOC[i], 1)
        end

		loginStr = loginStr .. " Please choose your outfit."
		player:sendOutfitWindow()
	else
		if loginStr ~= "" then
			player:sendTextMessage(MESSAGE_LOGIN, loginStr)
		end

		player:sendTextMessage(MESSAGE_LOGIN, string.format("Your last visit in ".. SERVER_NAME ..": %s.", os.date("%d. %b %Y %X", player:getLastLoginSaved())))
	end

	-- Stamina
	nextUseStaminaTime[player.uid] = 0

	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(Storage.Promotion)
		if not promotion and value ~= 1 then
			player:setStorageValue(STORAGEVALUE_PROMOTION, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	local playerId = player:getId()
	DailyReward.init(playerId)

	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %d %s in your reward chest.",
		rewards, rewards > 1 and "rewards" or "reward"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- Events
	player:registerEvent("PlayerDeath")
	player:registerEvent("DropLoot")


	if onExerciseTraining[player:getId()] then -- onLogin & onLogout
		stopEvent(onExerciseTraining[player:getId()].event)
		onExerciseTraining[player:getId()] = nil
		player:setTraining(false)
	end
	return true
end

login:register()
