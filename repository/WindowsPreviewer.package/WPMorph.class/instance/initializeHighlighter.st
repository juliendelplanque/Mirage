initialization
initializeHighlighter
	highlighter := WPWindowsHighlighter new
							highlightWidth: self thumbnailsBorderWidth;
							highlightColor: self thumbnailsSelectedBorderColor;
							listenToWPModelAnnouncements: self wpModel;
							yourself