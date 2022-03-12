local tibiaCoin = Action()

function tibiaCoin.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local points = item:getCount()
    db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. points .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received "..points.." coins")
    doSendMagicEffect(player:getPosition(), 28)
    doSendMagicEffect(player:getPosition(), 76)
    doSendMagicEffect(player:getPosition(), 75)
    doSendMagicEffect(player:getPosition(), 50)
    item:remove(points)
    return true
end

tibiaCoin:id(22118)
tibiaCoin:register()
