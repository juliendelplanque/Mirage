listening
listenToFocusLossOn: aWPOpenRequest
	self announcer when: MorphLostFocus do: [ :ann |
		aWPOpenRequest model close ].