setting browser
updateSettingBrowsers
	self flag: #hack.
	SettingBrowser allSubInstances do: #applyFilters