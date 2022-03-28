local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3174, 10)
end

spell:name("Light Magic Missile Rune")
spell:words("adori min vis")
spell:group("support")
spell:vocation("druid;", "elder druid;", "Celtic Druid;", "Spirit Healer;", "sorcerer;", "master sorcerer;", "Archmage;", "Arcane Wizard;", "Divine Mage;")

spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(15)
spell:mana(120)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
