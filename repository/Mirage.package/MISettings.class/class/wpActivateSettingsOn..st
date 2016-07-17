settings-definition
wpActivateSettingsOn: aBuilder
	<systemsettings>
	(aBuilder setting: #windowsPreviewer)
		label: 'Activate';
		description: 'Activate the window previewer' translated;
		setSelector: #install:;
		getSelector: #isInstalled;
		target: MIModel;
		parent: #windowsPreviewerSettings.