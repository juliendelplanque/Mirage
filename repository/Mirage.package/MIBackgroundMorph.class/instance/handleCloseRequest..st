announcement handling
handleCloseRequest: aWPCloseRequest
	self announcer unsubscribe: self.
	aWPCloseRequest model announcer unsubscribe: self.
	self delete