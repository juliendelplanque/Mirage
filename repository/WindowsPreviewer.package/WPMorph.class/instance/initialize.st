initialization
initialize
	super initialize.
	self
		wpModel: WPModel new;
		color: Color transparent;
		listenToWPModelAnnouncements: self wpModel;
		listenToFocusLoss;
		initializeThumbnails;
		initializeTitleMorph;
		initializeHighlighter;
		createShortcuts;
		beSticky.
	
	"The next line to have a border around the first thumbnail."
	self wpModel announceThumbnailSelected: 1