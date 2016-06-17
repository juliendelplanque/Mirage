keymap
createOpenShortcut
	self globalKMCategory
		addKeymapEntry: (KMKeymap
								named: #'Open windows previews'
								shortcut: KMModifier ctrl + KMModifier shift + Character space asKeyCombination
								action: [ self open ]).