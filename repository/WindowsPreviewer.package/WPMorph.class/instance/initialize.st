initialization
initialize
	super initialize.
	
	self wpModel: WPModel new.
	self listenToWPModelAnnouncements.
	self color: Color transparent.
	self initializeThumbnails.
	
	self initializeTitleMorph.
	
	self createShortcuts.
	self wpModel announceThumbnailSelected: 1.
	
	self announcer when: MorphLostFocus do: [ :ann |
		self closeIfNeeded ].
	
	self sticky: true