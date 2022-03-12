function Creature:onChangeOutfit(outfit)
	return true
end

function Creature:onAreaCombat(tile, isAggressive)
	return RETURNVALUE_NOERROR
end

picIf = {}
function Creature:onTargetCombat(target)
	if not self then
		return true
	end

	if not picIf[target.uid] then
		if target:isMonster() then
			target:registerEvent("RewardSystemSlogan")
			picIf[target.uid] = {}
		end
	end

	if target:isPlayer() then
		if self:isMonster() then
			local protectionStorage = target:getStorageValue(Storage.combatProtectionStorage)

			if target:getIp() == 0 then -- If player is disconnected, monster shall ignore to attack the player
				if target:isPzLocked() then return true end
				if protectionStorage <= 0 then
					addEvent(removeCombatProtection, 30 * 1000, target.uid)
					target:setStorageValue(Storage.combatProtectionStorage, 1)
				elseif protectionStorage == 1 then
					self:searchTarget()
					return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
				end

				return true
			end

			if protectionStorage >= os.time() then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

	if ((target:isMonster() and self:isPlayer() and target:getMaster() == self)
	or (self:isMonster() and target:isPlayer() and self:getMaster() == target)) then
		return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
	end

	if PARTY_PROTECTION ~= 0 then
		if self:isPlayer() and target:isPlayer() then
			local party = self:getParty()
			if party then
				local targetParty = target:getParty()
				if targetParty and targetParty == party then
					return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
				end
			end
		end
	end

	if ADVANCED_SECURE_MODE ~= 0 then
		if self:isPlayer() and target:isPlayer() then
			if self:hasSecureMode() then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

	self:addEventStamina(target)
	return true
end