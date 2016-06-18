announcement handling
handleThumbnailSelected: aWPThumbnailSelected

	self
		refreshThumbnailsOn: aWPThumbnailSelected;
		refreshTitleOn: aWPThumbnailSelected.
	
	aWPThumbnailSelected thumbnail
		borderColor: self thumbnailsSelectedBorderColor.