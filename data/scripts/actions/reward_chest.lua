-- local reward = Action()

-- function reward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
--     --Reward Chest
--     if item:getId() == 19250 then
--         player:getRewardChest()
--     --Boss Corpse
--     elseif item:getActionId() == 19250 then
--         local reward = REWARD_CHEST.LOOT[tonumber(item:getAttribute('text'))][player:getGuid()]
--         if reward ~= nil then
--             local rewardBag = Container(doCreateItemEx(REWARD_CHEST.CONTAINER, 1))
--             addContainerItems(rewardBag, reward)
--             if player:getCapacity() < rewardBag:getCapacity() then
--                 return player:sendCancelMessage(RETURNVALUE_NOTENOUGHCAPACITY)
--             end
--             if player:addItemEx(rewardBag, false) == RETURNVALUE_NOERROR then
--                 REWARD_CHEST.LOOT[tonumber(item:getAttribute('text'))][player:getGuid()] = nil
--                 player:sendCancelMessage('You have picked a reward container.')
--             else
--                 player:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
--                 return true
--             end
--         end
--     end
--     return false
-- end

-- reward:id(19250)
-- reward:register()
