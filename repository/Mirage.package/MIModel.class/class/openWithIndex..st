opening
openWithIndex: anInteger
	| instance |
	instance := self new.
	(self views collect: #new)
		do: [ :view | view listenToWPModelAnnouncementsOf: instance ].
	self windowsOrderingMethod value: instance.
	^ instance
		openWithIndex: anInteger;
		yourself