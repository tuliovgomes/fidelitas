local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3176, 4)
end

spell:name("Poison Wall Rune")
spell:words("adevo mas grav pox")
spell:group("support")
spell:vocation("druid;", "elder druid;", "Celtic Druid;", "Spirit Healer;", "sorcerer;", "master sorcerer;", "Archmage;", "Arcane Wizard;", "Divine Mage;")

spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(29)
spell:mana(640)
spell:soul(3)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
