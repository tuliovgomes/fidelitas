local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3195, 3)
end

spell:name("Soulfire Rune")
spell:words("adevo res flam")
spell:group("support")
spell:vocation("druid;", "elder druid;", "Celtic Druid;", "Spirit Healer;", "sorcerer;", "master sorcerer;", "Archmage;", "Arcane Wizard;", "Divine Mage;")

spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(27)
spell:mana(420)
spell:soul(3)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
