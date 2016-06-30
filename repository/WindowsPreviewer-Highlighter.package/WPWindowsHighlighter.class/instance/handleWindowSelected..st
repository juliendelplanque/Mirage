announcement handling
handleWindowSelected: aWPThumbnailSelected
	highlightMorph
		position: aWPThumbnailSelected window position; 
		extent: aWPThumbnailSelected window extent;
		borderWidth: self highlightWidth;
		borderColor: self highlightColor