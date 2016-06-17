initialization
initializeHighlighter
	highlighter := WPWindowsHighlighter new
							wpModel: self wpModel;
							highlightWidth: self thumbnailsBorderWidth;
							highlightColor: self thumbnailsSelectedBorderColor;
							yourself.
	highlighter listenToWPModelAnnouncements