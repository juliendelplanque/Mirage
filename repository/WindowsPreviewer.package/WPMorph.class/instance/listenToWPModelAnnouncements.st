listening
listenToWPModelAnnouncements
	self wpModel announcer
		when: WPThumbnailSelected do: [ :ann | self handleThumbnailSelected: ann ];
		when: WPCloseRequest do: [ :ann | self handleCloseRequest: ann ]