actions
closeCurrentWindow
	self currentWindow mirageClose.
	self close.
	(self windowsManaged size - 1) > 0
		ifTrue: [ self class
						openWithIndex: (currentIndex = 1
												ifTrue: [ 1 ]
												ifFalse: [ currentIndex - 1 ]) ]