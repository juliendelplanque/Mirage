initialization
initializeHighlighter
	highlighter := WPWindowsHighlighter new
							highlightWidth: self thumbnailsBorderWidth;
							highlightColor: self thumbnailsSelectedBorderColor;
							listenToWPModelAnnouncementsOf: self wpModel;
							yourself