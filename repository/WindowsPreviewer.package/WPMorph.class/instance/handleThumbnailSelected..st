announcement handling
handleThumbnailSelected: aWPThumbnailSelected
	aWPThumbnailSelected previousThumbnail
		borderColor: Color black.
	
	aWPThumbnailSelected thumbnail
		borderColor: self thumbnailsSelectedBorderColor.
	
	titleMorph title: aWPThumbnailSelected window label contents