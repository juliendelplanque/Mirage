settings
wpSettingOn: aBuilder
	<systemsettings>
	(aBuilder setting: #wpWindowsHighlighterSetting)
		label: 'Windows highlighter';
		description: 'Activate the windows highlighter' translated;
		setSelector: #activate:;
		getSelector: #isActivated;
		target: self;
		parent: #wpViewsSettings.