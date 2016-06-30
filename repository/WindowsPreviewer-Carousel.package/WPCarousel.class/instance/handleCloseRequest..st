announcement handling
handleCloseRequest: aWPCloseRequest
	aWPCloseRequest model announcer unsubscribe: self.
	self announcer unsubscribe: self