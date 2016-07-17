listening
listenToWPModelAnnouncementsOf: aWPModel
	aWPModel announcer
		when: MIWindowSelected do: [ :ann | self handleWindowSelected: ann ];
		when: MICloseRequest do: [ :ann | self handleCloseRequest: ann ];
		when: MIOpenRequest do: [ :ann | self handleOpenRequest: ann ]