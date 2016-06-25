actions
closeCurrentWindow
	| windowToClose |
	windowToClose := self currentWindow.
	self windowsManaged: (self windowsManaged copyWithout: self currentWindow).
	currentIndex := self previousIndex.
	self announceWindowClosed: windowToClose.
	windowToClose wpClose