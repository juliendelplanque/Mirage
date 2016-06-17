announcement handling
handleThumbnailSelected: aWPThumbnailSelected
	
	highlightMorph
		position: aWPThumbnailSelected model currentWindow position; 
		extent: aWPThumbnailSelected model currentWindow extent;
		borderWidth: self highlightWidth;
		borderColor: self highlightColor