actions
open
	self manageAtLeastOneWindow
		ifTrue: [
			self announceOpenRequest.
			self announceWindowSelected ]