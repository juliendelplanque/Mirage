initialization
initialize
	super initialize.
	self highlightColor: Color orange.
	self highlightWidth: 3.
	highlightMorph := BorderedMorph new.
	highlightMorph
		color: Color transparent;
		borderColor: self highlightColor;
		borderWidth: self highlightWidth;
		beSticky