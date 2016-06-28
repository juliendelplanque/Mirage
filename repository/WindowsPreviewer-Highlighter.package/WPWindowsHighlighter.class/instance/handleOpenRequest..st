announcement handling
handleOpenRequest: aWPOpenRequest
	World submorphs
		detect: #isWindowsPreviewer
		ifFound: [ :windowsPreviewer | World addMorph: highlightMorph after: windowsPreviewer ]
		ifNone: [ highlightMorph openInWorld ]