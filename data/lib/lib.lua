-- Core API functions implemented in Lua
dofile('data/lib/core/load.lua')
dofile('data/lib/core/functions/load.lua')

-- Compatibility library for our old Lua API
dofile('data/lib/compat/compat.lua')
dofile('data/lib/compat/daily_reward_lib.lua')
dofile('data/lib/compat/reward_boss_lib.lua')

-- Debugging helper function for Lua developers
dofile('data/lib/debugging/dump.lua')

-- Tables library
dofile('data/lib/tables/load.lua')
