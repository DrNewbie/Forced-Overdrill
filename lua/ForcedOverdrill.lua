if not Network or Network:is_client() or not managers.network or managers.network.matchmake:get_lobby_attributes() <= 1 then
	return
end

local _queue_dialog_orig = DialogManager.queue_dialog
function DialogManager:queue_dialog(id,...)
	_queue_dialog_orig(self,id,...)
	if id == "Play_pln_fwb_01" then
		managers.groupai:state():on_police_called("alarm_pager_hang_up")
	end
	if id == "Play_pln_fwb_35" then
		if managers.job:current_level_id() == "red2" and not managers.groupai:state():whisper_mode() and (Global.game_settings.difficulty == "overkill_290" or Global.game_settings.difficulty == "sm_wish") then
			for _, script in pairs(managers.mission:scripts()) do
				for id, element in pairs(script:elements()) do
					for _, trigger in pairs(element:values().trigger_list or {}) do
						if trigger.notify_unit_sequence == "light_on" then
							element:on_executed()
							managers.chat:_receive_message(1, "ForcedOverdrill", " OK!!", Color.green) 
						end
					end
				end
			end
		end
	end
end
