opening
open
	| instance |
	instance := self new.
	(self views collect: #new)
		do: [ :view | view listenToWPModelAnnouncementsOf: instance ].
	^ instance
		open;
		yourself