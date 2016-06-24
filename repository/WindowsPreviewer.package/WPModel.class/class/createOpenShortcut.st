keymap
createOpenShortcut
	self globalKMCategory
		addKeymapEntry: (KMKeymap
								named: #'Open windows previews'
								shortcut: KMModifier ctrl + KMUntypeableSingleKeyCombination tab"KMModifier shift + Character space asKeyCombination"
								action: [ self open ]).