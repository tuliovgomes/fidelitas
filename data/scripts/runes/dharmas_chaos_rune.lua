local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 4.3) + 52
	local max = (level / 5) + (magicLevel * 7.4) + 68
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("rune")

function spell.onCastSpell(creature, variant, isHotkey)
	return combat:execute(creature, variant)
end

spell:name("Dharmas Chaos Rune")
spell:group("attack")
spell:id(21)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(120)
spell:magicLevel(48)
spell:runeId(3150)
spell:charges(3)
spell:needTarget(true)
spell:isBlocking(true)
spell:allowFarUse(true)
spell:register()
