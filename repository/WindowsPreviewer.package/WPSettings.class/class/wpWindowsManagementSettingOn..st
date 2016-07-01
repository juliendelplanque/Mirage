settings-definition
wpWindowsManagementSettingOn: aBuilder
	<systemsettings>
	(aBuilder pickOne: #windowsOrder)
		label: 'Windows management';
		description: 'Set the windows management needed' translated;
		target: WPModel;
		domainValues: self windowsOrderingChoices;
		setSelector: #windowsOrderingMethod:;
		getSelector: #windowsOrderingMethod;
		parent: #windowsPreviewerSettings