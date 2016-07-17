settings-definition
wpOpenShortcutSettingsOn: aBuilder
	<systemsettings>
	MIModel isInstalled
		ifTrue: [
			(aBuilder shortcut: #mirageOpenShortcutSetting)
				label: 'Open shortcut';
				description: 'Set the shortcut to open the windows previewer' translated;
				category: MIModel globalKMCategoryName;
				shortcutName: #'Open windows previews';
				parent: #mirageSettings ]