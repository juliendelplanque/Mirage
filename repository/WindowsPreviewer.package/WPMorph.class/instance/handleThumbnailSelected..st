announcement handling
handleThumbnailSelected: aWPThumbnailSelected
	aWPThumbnailSelected previousThumbnail
		borderColor: Color black.
	
	self refreshThumbnailsOn: aWPThumbnailSelected.
	
	aWPThumbnailSelected thumbnail
		borderColor: self thumbnailsSelectedBorderColor.
	
	self refreshTitleOn: aWPThumbnailSelected