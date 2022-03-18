local combat = Combat()

combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, TRUE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local min = (level / 2) + (skill + attack) / 2
	local max = (level / 2) + skill + attack
	return -min * 2.60, -max * 2.80 -- TODO : Use New Real Formula instead of an %
end

local condition = createConditionObject(CONDITION_PARALYZE)

setConditionParam(condition, CONDITION_PARAM_TICKS, 90000)
setConditionFormula(condition, -2.2, 1, -3.9, 2)
combat:addCondition(condition)

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(107)
spell:name("bash Throw")
spell:words("exori bash")
spell:level(75)
spell:manaPercent(5)
spell:isPremium(true)
spell:range(5)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()