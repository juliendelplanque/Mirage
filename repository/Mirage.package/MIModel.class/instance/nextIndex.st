index computing
nextIndex
	"Computes the value of the next index and returns it. Does not change #currentIndex inst. var."
	^ currentIndex = self windowsManaged size
		ifTrue: [ 1 ]
		ifFalse: [ currentIndex + 1 ].