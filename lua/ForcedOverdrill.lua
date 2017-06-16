if not Network or Network:is_client() then
	return
end

Hooks:PostHook(DialogManager, "queue_dialog", "ForcedOverdrill_Event", function(self, id, ...)
	if managers.job:current_level_id() == "red2" and (Global.game_settings.difficulty == "overkill_290" or Global.game_settings.difficulty == "sm_wish") then
		if id == "Play_pln_fwb_01" then
			managers.groupai:state():on_police_called("alarm_pager_hang_up")
		end
		if id == "Play_pln_fwb_35" and not managers.groupai:state():whisper_mode() then
			for _, script in pairs(managers.mission:scripts()) do
				for idx, element in pairs(script:elements()) do
					if tostring(idx) == "104194" then
						element:on_executed()
						managers.chat:_receive_message(1, "ForcedOverdrill", " OK!!", Color.green)
					end
					if tostring(idx) == "104136" then
						element:on_executed()
					end
					
				end
			end
		end
	end
end)