initialization
initialize
	super initialize.
	self color: Color gray.
	title := '' asMorph.
	title emphasis: 1. "Bold text"
	self addMorph: title