announcement handling
handleOpenRequest: aWPOpenRequest
	aWPOpenRequest background submorphs
		detect: #isWindowsPreviewer
		ifFound: [ :windowsPreviewer | aWPOpenRequest background addMorph: highlightMorph after: windowsPreviewer ]
		ifNone: [ aWPOpenRequest background addMorph: highlightMorph ]