announcement handling
handleOpenRequest: aWPOpenRequest
	self
		refreshThumbnailsOn: aWPOpenRequest;
		initializeTitleMorph;
		openCenteredInBackground: aWPOpenRequest background