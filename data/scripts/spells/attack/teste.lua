local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
combat:setFormula(-0.3, 0, -0.45, 0)


local combat1 = Combat()
combat1:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat1:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat1:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
combat1:setFormula(-0.3, 0, -0.45, 0)



local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat2:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
combat2:setFormula(-0.3, 0, -0.45, 0)


local spell = Spell("instant")

function spell.onCastSpell1(creature, var)
	return combat:execute(creature, var)
end

function spell.onCastSpell2(creature, var)
	return combat1:execute(creature, var)
end

function spell.onCastSpell3(creature, var)
	return combat2:execute(creature, var)
end

addEvent(onCastSpell1, 2, var)
addEvent(onCastSpell2, 500, var)
addEvent(onCastSpell3, 900, var)


spell:group("attack")
spell:id(140)
spell:name("Electrify")
spell:words("teste")
spell:level(34)
spell:mana(30)
spell:isAggressive(true)
spell:range(3)
spell:needTarget(true)
spell:blockWalls(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;", "master sorcerer;", "Archmage;", "Arcane Wizard;", "Divine Mage;")
spell:register()