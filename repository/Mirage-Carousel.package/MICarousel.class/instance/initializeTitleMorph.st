initialization
initializeTitleMorph
	titleMorph := MITitleMorph new.
	titleMorph
		color: Color transparent;
		titleColor: self thumbnailsSelectedBorderColor;
		extent: self extent x @ titleMorph extent y;
		minimalHeight;
		position: titleMorph position x @ (titleMorph position y + self extent y).
	self addMorph: titleMorph.