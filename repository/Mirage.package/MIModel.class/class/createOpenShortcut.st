keymap
createOpenShortcut
	self globalKMCategory
		addKeymapEntry: (KMKeymap
								named: #'Open windows previews'
								shortcut: Smalltalk os mirageOpenPreviewerShortcut
								action: [ self open ]).