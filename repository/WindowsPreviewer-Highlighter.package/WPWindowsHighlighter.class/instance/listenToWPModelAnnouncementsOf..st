listening
listenToWPModelAnnouncementsOf: aWPModel
	aWPModel announcer
		when: WPWindowSelected do: [ :ann | self handleWindowSelected: ann ];
		when: WPCloseRequest do: [ :ann | self handleCloseRequest: ann ];
		when: WPOpenRequest do: [ :ann | self handleOpenRequest: ann ]