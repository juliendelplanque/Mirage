accessing
nextIndex
	^ currentIndex = self windowsManaged size
		ifTrue: [ 1 ]
		ifFalse: [ currentIndex + 1 ].