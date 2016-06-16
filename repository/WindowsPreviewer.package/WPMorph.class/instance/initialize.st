initialization
initialize
	super initialize.
	self
		wpModel: WPModel new;
		color: Color transparent;
		listenToWPModelAnnouncements;
		listenToFocusLoss;
		initializeThumbnails;
		initializeTitleMorph;
		createShortcuts;
		beSticky.
	
	"The next line to have a border around the first thumbnail."
	self wpModel announceThumbnailSelected: 1