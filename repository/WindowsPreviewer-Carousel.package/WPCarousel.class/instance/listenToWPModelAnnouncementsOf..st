listening
listenToWPModelAnnouncementsOf: aWPModel
	aWPModel announcer
		when: WPWindowSelected send: #handleWindowSelected: to: self;
		when: WPCloseRequest send: #handleCloseRequest: to: self;
		when: WPOpenRequest send: #handleOpenRequest: to: self