announcement handling
handleOpenRequest: aWPOpenRequest
	aWPOpenRequest model hasViewListeningToUserInput
		ifFalse: [ ^ self ].
	World submorphs
		detect: #isWindowsPreviewer
		ifFound: [ :windowsPreviewer | World addMorph: highlightMorph after: windowsPreviewer ]
		ifNone: [ highlightMorph openInWorld ]