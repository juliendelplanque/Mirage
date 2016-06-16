initialization
initialize
	super initialize.
	
	self color: Color transparent.
	self initializeThumbnails.
	
	self initializeTitleMorph.
	
	self createShortcuts.
	self selectThumbnailUsing: #yourself.
	
	self announcer when: MorphLostFocus do: [ :ann |
		self closeIfNeeded ].
	
	self sticky: true