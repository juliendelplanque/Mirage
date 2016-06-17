announcement handling
handleOpenRequest: aWPOpenRequest
	self
		initializeThumbnailsOn: aWPOpenRequest;
		initializeTitleMorph;
		createShortcutsOn: aWPOpenRequest;
		listenToFocusLossOn: aWPOpenRequest;
		openCenteredInWorld;
		takeKeyboardFocus