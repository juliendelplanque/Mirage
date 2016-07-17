*Mirage
mirageOpen
	self isMinimized
		ifTrue: [ self restore ]
		ifFalse: [
			self isActive
				ifFalse: [self activate] ]