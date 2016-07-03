announcement handling
handleOpenRequest: aWPOpenRequest
	aWPOpenRequest background submorphs
		detect: #isWindowsPreviewer
		ifFound: [ :windowsPreviewer | aWPOpenRequest background addMorph: windowHighlighter after: windowsPreviewer ]
		ifNone: [ aWPOpenRequest background addMorph: windowHighlighter ]