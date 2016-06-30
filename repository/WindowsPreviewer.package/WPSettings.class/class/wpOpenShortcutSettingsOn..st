settings-definition
wpOpenShortcutSettingsOn: aBuilder
	<systemsettings>
	WPModel isInstalled
		ifTrue: [
			(aBuilder shortcut: #wpOpenShortcutSetting)
				label: 'Open shortcut';
				description: 'Set the shortcut to open the windows previewer' translated;
				category: WPModel globalKMCategoryName;
				shortcutName: #'Open windows previews';
				parent: #windowsPreviewerSettings ]