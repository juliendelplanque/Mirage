listening
listenToWPModelAnnouncementsOf: aWPModel
	aWPModel announcer
		when: MIWindowSelected send: #handleWindowSelected: to: self;
		when: MICloseRequest send: #handleCloseRequest: to: self;
		when: MIOpenRequest send: #handleOpenRequest: to: self