setting building
buildSettingNamed: aSymbol with: aBuilder
	^ (aBuilder setting: aSymbol)
			setSelector: #activate:;
			getSelector: #isActivated;
			target: self;
			parent: self parent;
			yourself