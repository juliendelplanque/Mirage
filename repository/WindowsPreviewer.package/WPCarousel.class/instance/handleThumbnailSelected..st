announcement handling
handleThumbnailSelected: aWPThumbnailSelected
	aWPThumbnailSelected previousThumbnail
		borderColor: self thumbnailsBorderColor.
	
	aWPThumbnailSelected thumbnail
		borderColor: self thumbnailsSelectedBorderColor.
	
	self
		refreshThumbnailsOn: aWPThumbnailSelected;
		refreshTitleOn: aWPThumbnailSelected.