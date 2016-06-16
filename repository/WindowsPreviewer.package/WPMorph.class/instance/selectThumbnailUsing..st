actions
selectThumbnailUsing: aSymbol
	"Change thumbnail selected"
	currentThumbnail borderColor: Color black.
	aSymbol value: self.
	currentThumbnail borderColor: self thumbnailsBorderColor.
	"Title management"
	titleMorph title: self windowForCurrentThumbnail label contents.