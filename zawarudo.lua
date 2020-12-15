if not SGO._host_responded then return end
if not GameSetup then return end
toggleslowdown = toggleslowdown or false
local speed = 0.01 --was 0.001
local desc_pausable_world = {
	speed = speed,
	fade_in = 0.05,
	sustain = 5,
	fade_out = 0.1,
	timer = "pausable"
}
--[[
local desc_pausable_player = {
	speed = speed,
	fade_in = 0.05,
	sustain = SGO.settings.use_slow2 or 5,
	fade_out = 0.1,
	timer = "pausable",
	affect_timer = "player"
}
--]]
if toggleslowdown then
	managers.time_speed:stop_effect("slowdowntimeworld", 0.1)
	--managers.time_speed:stop_effect("slowdowntimeplayer", 0.1)
	toggleslowdown = false
else
	managers.time_speed:play_effect("slowdowntimeworld", desc_pausable_world)
	--managers.time_speed:play_effect("slowdowntimeplayer", desc_pausable_player)
	toggleslowdown = true
end