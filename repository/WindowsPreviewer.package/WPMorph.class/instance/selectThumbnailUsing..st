actions
selectThumbnailUsing: aSymbol
	"Change thumbnail selected"
	current borderColor: Color black.
	aSymbol value: self.
	current borderColor: Color red.
	"Title management"
	titleMorph title: self windowForCurrentThumbnail title.