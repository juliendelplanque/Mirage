index computing
previousIndex
	"Computes the value of the previous index and returns it. Does not change #currentIndex inst. var."
	^ currentIndex = 1
		ifTrue: [ self windowsManaged size ]
		ifFalse: [ currentIndex - 1 ].