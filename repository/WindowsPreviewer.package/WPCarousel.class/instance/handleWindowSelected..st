announcement handling
handleWindowSelected: aWPThumbnailSelected

	self
		refreshThumbnailsOn: aWPThumbnailSelected;
		refreshTitleOn: aWPThumbnailSelected.
	
	aWPThumbnailSelected thumbnail
		borderColor: self thumbnailsSelectedBorderColor.