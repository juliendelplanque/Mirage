announcement handling
handleOpenRequest: aWPOpenRequest
	self
		createShortcutsOn: aWPOpenRequest model;
		listenToFocusLossOn: aWPOpenRequest;
		extent: World extent;
		openInWorld;
		takeKeyboardFocus