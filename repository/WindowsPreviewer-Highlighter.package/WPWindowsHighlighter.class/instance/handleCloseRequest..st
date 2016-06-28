announcement handling
handleCloseRequest: aWPCloseRequest
	World removeMorph: highlightMorph.
	aWPCloseRequest model announcer unsubscribe: self