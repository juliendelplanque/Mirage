announcement handling
handleOpenRequest: aWPOpenRequest
	self
		initializeThumbnailsBorderOn: aWPOpenRequest;
		refreshThumbnailsOn: aWPOpenRequest;
		initializeTitleMorph;
		createShortcutsOn: aWPOpenRequest;
		listenToFocusLossOn: aWPOpenRequest;
		openCenteredInWorld;
		takeKeyboardFocus