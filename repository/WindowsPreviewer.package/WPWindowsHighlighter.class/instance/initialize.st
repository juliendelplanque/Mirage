initialization
initialize
	super initialize.
	highlightMorph := BorderedMorph new.
	highlightMorph announcer when: MorphGotFocus do: [ self wpModel close ].
	highlightMorph
		color: Color transparent;
		beSticky;
		openInWorld