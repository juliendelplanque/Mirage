announcement handling
handleWindowSelected: aWPThumbnailSelected
	aWPThumbnailSelected model hasViewListeningToUserInput
		ifFalse: [ ^ self ].
		
	highlightMorph
		position: aWPThumbnailSelected window position; 
		extent: aWPThumbnailSelected window extent;
		borderWidth: self highlightWidth;
		borderColor: self highlightColor