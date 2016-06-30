initialization
initialize
	super initialize.
	self highlightColor: Smalltalk ui theme wpHighlighterBorderColor.
	self highlightWidth: Smalltalk ui theme wpHighlighterBorderWidth.
	highlightMorph := BorderedMorph new.
	highlightMorph
		color: Color transparent;
		borderColor: self highlightColor;
		borderWidth: self highlightWidth