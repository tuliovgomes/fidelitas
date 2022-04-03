local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 4.3) + 28
	local max = (level / 5) + (magicLevel * 7.4) + 34
	return -min, -max
end


combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("rune")

function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

spell:name("Great Magic Missile Rune")
spell:group("attack")
spell:id(130)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(80)
spell:magicLevel(8)
spell:runeId(3201)
spell:charges(5)
spell:needTarget(true)
spell:isBlocking(true)
spell:allowFarUse(true)
spell:register()
