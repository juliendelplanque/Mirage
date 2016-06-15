initialization
initialize
	super initialize.
	self initializeThumbnails.
	
	self initializeTitleMorph.
	
	self createShortcuts.
	self selectThumbnailUsing: #yourself.