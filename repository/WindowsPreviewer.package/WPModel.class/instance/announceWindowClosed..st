announcing
announceWindowClosed: aSystemWindow
	self announce: (WPWindowClosed new
							model: self;
							windowClosed: aSystemWindow;
							yourself)