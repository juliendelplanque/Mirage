announcement handling
handleThumbnailSelected: aWPThumbnailSelected
	currentThumbnail borderColor: Color black.
	
	"Change thumbnail selected"
	currentThumbnail := self thumbnails at: aWPThumbnailSelected index.
	
	currentThumbnail borderColor: self thumbnailsSelectedBorderColor.
	"Title management"
	titleMorph title: self wpModel currentWindow label contents.