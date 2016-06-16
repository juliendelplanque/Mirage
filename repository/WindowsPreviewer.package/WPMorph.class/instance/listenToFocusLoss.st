listening
listenToFocusLoss
	self announcer when: MorphLostFocus do: [ :ann |
		self wpModel close ].