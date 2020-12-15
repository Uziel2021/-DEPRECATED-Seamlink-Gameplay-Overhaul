if not SGO then return end
--subject for a change
if not Network:is_client() and BaseNetworkHandler._gamestate_filter.any_ingame_playing[game_state_machine:last_queued_state_name()] then
	for id = 1, 4, 1 do
		if managers.network:session():peer(id) and not alive(managers.network:session():peer(id):unit()) then
			IngameWaitingForRespawnState.request_player_spawn(id)
		end
	end
end