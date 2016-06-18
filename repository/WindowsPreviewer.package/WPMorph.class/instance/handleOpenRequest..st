announcement handling
handleOpenRequest: aWPOpenRequest
	self
		refreshThumbnailsOn: aWPOpenRequest;
		initializeTitleMorph;
		createShortcutsOn: aWPOpenRequest;
		listenToFocusLossOn: aWPOpenRequest;
		openCenteredInWorld;
		takeKeyboardFocus