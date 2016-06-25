announcement handling
handleWindowClosed: aWPWindowClosed
	
	"self
		handleWindowSelected: aWPWindowClosed"
	self
		refreshThumbnailsOn: aWPWindowClosed;
		refreshTitleOn: aWPWindowClosed.