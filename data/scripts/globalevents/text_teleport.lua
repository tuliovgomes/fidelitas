local positions = {
    ["HUNTS"] = Position(987, 975, 7),
    ["HUNTS FREE"] = Position(1085, 1025, 7),
    ["FIDELITAS"] = Position(1085, 1039, 7),
    ["TEMPLO"] = Position(1087, 1025, 7),
    ["NPCS"] = Position(1084, 1039, 7),
    ["NPC"] = Position(1086, 1025, 7),
}


local teleportText = GlobalEvent("Teleport Texts")

function teleportText.onThink(interval, lastExecution)

    for text, position in pairs(positions) do
        position:sendMessage(text)
        position:sendMagicEffect(CONST_ME_TUTORIALSQUARE)
        position:sendMagicEffect(CONST_ME_TUTORIALARROW)
    end

	return true
end

teleportText:interval(3200)
teleportText:register()