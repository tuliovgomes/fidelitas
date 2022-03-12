local serverInfo = TalkAction("!serverinfo")

function serverInfo.onSay(player, words, param)
	player:popupFYI( "Server Info: \n"
	.. "\nExp rate: " .. getRateFromTable(experienceStages, player:getLevel(), configManager.getNumber(configKeys.RATE_EXP))
	.. "\nSkill rate: " .. configManager.getNumber(configKeys.RATE_SKILL)
	.. "\nMagic rate: " .. configManager.getNumber(configKeys.RATE_MAGIC)
	.. "\nLoot rate: " .. configManager.getNumber(configKeys.RATE_LOOT))
	return false
end

serverInfo:separator(" ")
serverInfo:register()
