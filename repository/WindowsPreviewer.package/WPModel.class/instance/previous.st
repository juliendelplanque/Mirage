actions
previous
	currentIndex := currentIndex = 1
							ifTrue: [ self windowsManaged size ]
							ifFalse: [ currentIndex - 1 ].
	self announceThumbnailSelected: currentIndex