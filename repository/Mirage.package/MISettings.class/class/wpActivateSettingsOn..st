settings-definition
wpActivateSettingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #mirage)
		label: 'Activate';
		description: 'Activate the window previewer' translated;
		setSelector: #install:;
		getSelector: #isInstalled;
		target: MIModel;
		parent: #mirageSettings.