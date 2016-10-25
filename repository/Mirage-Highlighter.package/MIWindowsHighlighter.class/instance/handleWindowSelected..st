announcement handling
handleWindowSelected: aWPThumbnailSelected
	aWPThumbnailSelected window isCollapsed
		ifFalse: [ 
			windowHighlighter
				highlightWindow: aWPThumbnailSelected window ]