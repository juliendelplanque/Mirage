initialization
initializeBackground
	self background: MIBackgroundMorph new.
	self background
		listenToWPModelAnnouncementsOf: self.