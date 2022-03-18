local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_CURSED)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)


function onGetFormulaValues(_player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	return doCreatureAddHealth(_player, (_player:setHealth()-_player:getMaxHealth()/2))
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Cure Curse")
spell:words("exana mort")
spell:group("healing")
spell:vocation("knight;true", "elite knight;true")
spell:id(147)
spell:cooldown(6000)
spell:groupCooldown(1000)
spell:level(80)
spell:manaPercent(5)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
