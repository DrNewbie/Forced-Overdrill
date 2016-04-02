local _setfunc2 = HUDManager.blackscreen_fade_in_mid_text

function HUDManager:blackscreen_fade_in_mid_text()
	managers.network.matchmake:forced_private()
	managers.menu:show_warning_mod()
	return _setfunc2(self)
end

