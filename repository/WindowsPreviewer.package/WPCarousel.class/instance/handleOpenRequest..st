announcement handling
handleOpenRequest: aWPOpenRequest
	self
		refreshThumbnailsOn: aWPOpenRequest;
		initializeTitleMorph;
		createShortcutsOn: aWPOpenRequest model;
		listenToFocusLossOn: aWPOpenRequest;
		openCenteredInWorld;
		takeKeyboardFocus