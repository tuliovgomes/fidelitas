-- Combat settings
-- NOTE: valid values for worldType are: "pvp", "no-pvp" and "pvp-enforced"
worldType = "pvp"
hotkeyAimbotEnabled = true
protectionLevel = 7
pzLocked = 60 * 1000
removeChargesFromRunes = true
removeChargesFromPotions = true
removeWeaponAmmunition = true
removeWeaponCharges = true
timeToDecreaseFrags = 24 * 60 * 60 * 1000
whiteSkullTime = 15 * 60 * 1000
stairJumpExhaustion = 2 * 1000
experienceByKillingPlayers = false
expFromPlayersLevelRange = 75
dayKillsToRedSkull = 3
weekKillsToRedSkull = 5
monthKillsToRedSkull = 10
redSkullDuration = 1
blackSkullDuration = 3
orangeSkullDuration = 7

onlyInvitedCanMoveHouseItems = true
cleanProtectionZones = false

-- Connection Config
-- NOTE: maxPlayers set to 0 means no limit
-- NOTE: MaxPacketsPerSeconds if you change you will be subject to bugs by WPE, keep the default value of 25
ip = "127.0.0.1"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 0
motd = "Bem vindo ao Fidelitas!"
onePlayerOnlinePerAccount = true
allowClones = false
serverName = "Canary"
statusTimeout = 5 * 1000
replaceKickOnLogin = true
maxPacketsPerSecond = 25
maxItem = 2000
maxContainer = 100

-- Version
clientVersion = 1285
clientVersionStr = "12.85"

-- Depot Limit
freeDepotLimit = 2000
premiumDepotLimit = 10000
depotBoxes = 18

-- GameStore
gamestoreByModules = true

-- NOTE: Access only for Premium Account
onlyPremiumAccount = false

-- Customs
weatherRain = false
thunderEffect = false
allConsoleLog = false

-- Stamina in Trainers
staminaTrainer = false
staminaTrainerDelay = 5
staminaTrainerGain = 1
-- Stamina in PZ
staminaPz = false
staminaOrangeDelay = 1
staminaGreenDelay = 5
staminaPzGain = 1
-- Max players allowed on a dummy.
maxAllowedOnADummy = 1

-- Save interval per time
-- NOTE: togleSaveInterval: true = enable the save interval, false = disable the save interval
-- NOTE: saveIntervalType: "minute", "second" or "hour"
-- NOTE: togleSaveIntervalCleanMap: true = enable the clean map, false = disable the clean map
-- NOTE: saveIntervalTime: time based on what was set in "saveIntervalType"
togleSaveInterval = true
saveIntervalType = "hour"
togleSaveIntervalCleanMap = true
saveIntervalTime = 1

-- Imbuement
togleImbuementShrineStorage = false

-- Free quests
-- Add quest access to player when logging in
-- NOTE: Only quests that are in the "freequests.lua" script table will work
-- toggleFreeQuest = enable/disable the system
-- freeQuestStage = if you add more quests to the table, change this value to run freeQuest again
toggleFreeQuest = false
freeQuestStage = 1

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
-- Periods: daily/weekly/monthly/yearly/never
housePriceEachSQM = 1000
houseRentPeriod = "never"
houseOwnedByAccount = false

-- Item Usage
timeBetweenActions = 200
timeBetweenExActions = 1000

-- Push
-- NOTE: pushDelay: interval for every push
-- NOTE: pushDistanceDelay: delay for every distance push
-- NOTE: pushWhenAttacking: true = enable the push during attack, false = disable the push during attack
pushDelay = 1000
pushDistanceDelay = 1500
pushWhenAttacking = false

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
-- NOTE: unzip the map world.rar
mapName = "fidelitas"
mapAuthor = "Túlio Gomes"

-- Party List limitations
-- max distance in which players in party list are visible
-- NOTE partyListMaxDistance set to 0 means no limit
partyListMaxDistance = 30

-- Custom Map
-- NOTE: mapCustomEnabled: true = activate the map, false = disable the map
toggleMapCustom = false
mapCustomName = "fidelitas-custom"
mapCustomAuthor = "OpenTibiaBR"

-- Market
marketOfferDuration = 30 * 24 * 60 * 60
premiumToCreateMarketOffer = true
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 100

-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = "root"
mysqlDatabase = "canary"
mysqlPort = 3306
mysqlSock = ""
passwordType = "sha1"

-- Misc.
allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = false
classicEquipmentSlots = false
allowWalkthrough = true
coinPacketSize = 25
coinImagesURL = "http://127.0.0.1/images/store/"
classicAttackSpeed = false
showScriptsLogInConsole = false

-- Server Save
-- NOTE: serverSaveNotifyDuration in minutes
serverSaveNotifyMessage = true
serverSaveNotifyDuration = 5
serverSaveCleanMap = false
serverSaveClose = false
serverSaveShutdown = true

-- Sort loot by chance, most rare items drop first
-- it is good to be setted when you have a higher
-- rateLoot to avoid losing all rare items when
-- the corpse size is less than the total of loots
-- the monster can drop
sortLootByChance = false

-- Rates
-- NOTE: rateExp, rateSkill and rateMagic is used as a fallback only
-- To configure rates see file data/stages.lua
rateExp = 1
rateSkill = 50
rateLoot = 3
rateMagic = 25
rateSpawn = 1

-- Today regeneration condition over an loop every 1 second,
-- So values which should regenerated less then 1 second or won't will work
rateHealthRegen = 1.0
rateHealthRegenSpeed = 1.0
rateManaRegen = 1.0
rateManaRegenSpeed = 1.0
rateSoulRegen = 1.0
rateSoulRegenSpeed = 1.0

rateSpellCooldown = 1.0
rateAttackSpeed = 1.0
rateOfflineTrainingSpeed = rateAttackSpeed
rateExerciseTrainingSpeed = rateAttackSpeed

-- Monster rates
rateMonsterHealth = 1.0
rateMonsterAttack = 1.0
rateMonsterDefense = 1.0

-- Monsters
deSpawnRange = 2
deSpawnRadius = 50

-- Stamina
staminaSystem = true

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = true

-- Status server information
ownerName = "OpenTibiaBR"
ownerEmail = ""
url = "https://github.com/opentibiabr/canary"
location = "South America"

-- Sends Discord webhook notifications on startup, raids and shutdown.
-- The URL layout is https://discord.com/api/webhooks/:id/:token
-- Leave empty if you wish to disable.
discordWebhookURL = ""
