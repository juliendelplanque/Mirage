accessing
previousIndex
	^ currentIndex = 1
		ifTrue: [ self windowsManaged size ]
		ifFalse: [ currentIndex - 1 ].