actions
next
	currentIndex := currentIndex = self windowsManaged size
							ifTrue: [ 1 ]
							ifFalse: [ currentIndex + 1 ].
	self announceThumbnailSelected: currentIndex