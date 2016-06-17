announcement handling
handleCloseRequest: aWPCloseRequest
	self closeIfNeeded.
	aWPCloseRequest model announcer unsubscribe: self.
	self announcer unsubscribe: self