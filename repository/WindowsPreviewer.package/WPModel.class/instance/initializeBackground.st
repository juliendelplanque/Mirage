initialization
initializeBackground
	self background: WPBackgroundMorph new.
	self background
		listenToWPModelAnnouncementsOf: self.