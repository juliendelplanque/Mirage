initialization
initializeTitleMorph
	titleMorph := WPTitleMorph new.
	titleMorph titleColor: self thumbnailsBorderColor.
	titleMorph extent: self extent x @ titleMorph extent y.
	titleMorph minimalHeight.
	titleMorph position: titleMorph position x @ (titleMorph position y + self extent y).
	self addMorph: titleMorph.