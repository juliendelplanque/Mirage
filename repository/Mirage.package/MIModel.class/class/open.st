opening
open
	| instance |
	instance := self new.
	(self views collect: #new)
		do: [ :view | view listenToWPModelAnnouncementsOf: instance ].
	self windowsOrderingMethod value: instance.
	^ instance
		open;
		yourself