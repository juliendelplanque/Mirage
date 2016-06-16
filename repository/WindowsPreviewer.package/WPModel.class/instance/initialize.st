initialization
initialize
	super initialize.
	windowsManaged := self windowsOrderedByTaskbar.
	currentIndex := 1