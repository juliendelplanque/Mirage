announcement handling
handleThumbnailSelected: aWPThumbnailSelected
	
	highlightMorph
		position: self wpModel currentWindow position; 
		extent: self wpModel currentWindow extent;
		borderWidth: self highlightWidth;
		borderColor: self highlightColor